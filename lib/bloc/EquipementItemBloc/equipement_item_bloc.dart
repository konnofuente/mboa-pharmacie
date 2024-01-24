import 'dart:async';
import 'dart:convert';
import 'package:mboa_pharmacie/bloc/EquipementItemBloc/equipement_Item_event.dart';
import 'package:mboa_pharmacie/bloc/EquipementItemBloc/equipement_Item_state.dart';
import 'package:mboa_pharmacie/models/EquipementItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/EquipementItem.dart';
import '../../models/function.dart';
import '../../services/callApi.dart';

class EquipmentItemBloc extends Bloc<EquipmentItemEvent, EquipmentItemState> {
  EquipmentItemBloc() : super(const EquipmentItemState()) {
    on<AddEquipmentItem>(_onAddEquipmentItem);
    on<UpdateEquipmentItem>(_onUpdateEquipmentItem);
    on<DeleteEquipmentItem>(_onDeleteEquipmentItem);
    // on<FetchEquipmentItem>(_onFetchEquipmentItem);
  }

  Future<FutureOr<void>> _onAddEquipmentItem(
      AddEquipmentItem event, Emitter<EquipmentItemState> emit) async {
    // final state = this.state;

    // Generate unique ID for new Item
    int Id = AppFunction().generateUserId(event.Item.name);

// Create a new EquipmentItem object with generated ID
    EquipmentItem newItem = event.Item.copyWith(id: Id);

// Create a new list of items including the new item
    List<EquipmentItem> updatedList = List.from(state.allEquipmentItem)
      ..add(newItem);

// Emit the new state
    emit(EquipmentItemState(
      allEquipmentItem: updatedList,
    ));

    try {
      print(
          'Succesfully save of EquipmentItem ${state.allEquipmentItem.length}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('OMline EquipmentItem not created: $e !!!!!!!!!!!');
    }
  }

  Future<void> _onUpdateEquipmentItem(
      UpdateEquipmentItem event, Emitter<EquipmentItemState> emit) async {
    final state = this.state;
    final equipment_Item = event.Item;
    final index = state.allEquipmentItem.indexOf(equipment_Item);
    //update Locale storage
    List<EquipmentItem> allEquipmentItem = List.from(state.allEquipmentItem)
      ..remove(EquipmentItem);
    allEquipmentItem.insert(index, equipment_Item.copyWith());
  }

  FutureOr<void> _onDeleteEquipmentItem(
      DeleteEquipmentItem event, Emitter<EquipmentItemState> emit) {}

  Future<void> _onFetchEquipmentItem(
      FetchEquipmentItems event, Emitter<EquipmentItemState> emit) async {
    final state = this.state;
    final response =
        // await http.get(Uri.parse('http://31.187.76.34:8090/equipment_Items'));
        await CallApi().getData('equipment_Items');

    if (response.statusCode == 200) {
      final List<dynamic> equipment_ItemsJson = json.decode(response.body);
      emit(EquipmentItemState(
          allEquipmentItem: equipment_ItemsJson
              .map((json) => EquipmentItem.fromJson(jsonEncode(json)))
              .toList()));
      print("successfull fetch of all EquipmentItem!!!!!!");
    } else {
      throw Exception('Failed to load equipment_Items');
    }
  }
}
