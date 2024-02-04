import 'dart:async';
import 'dart:convert';
import '../../models/DrugItem.dart';
import '../../models/function.dart';
import '../../services/callApi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mboa_pharmacie/bloc/DrugItemBloc/drug_item_state.dart';
import 'package:mboa_pharmacie/bloc/DrugItemBloc/drug_item_event.dart';


class DrugItemBloc extends Bloc<DrugItemEvent, DrugItemState> {
  DrugItemBloc() : super(const DrugItemState()) {
    on<AddDrugItem>(_onAddDrugItem);
    on<UpdateDrugItem>(_onUpdateDrugItem);
    on<DeleteDrugItem>(_onDeleteDrugItem);
    // on<FetchDrugItem>(_onFetchDrugItem);
  }

  Future<FutureOr<void>> _onAddDrugItem(
      AddDrugItem event, Emitter<DrugItemState> emit) async {
    // final state = this.state;

    // Generate unique ID for new Item
    int Id = AppFunction().generateUserId(event.Item.name);

// Create a new DrugItem object with generated ID
    DrugItem newItem = event.Item.copyWith(id: Id);

// Create a new list of items including the new item
    List<DrugItem> updatedList = List.from(state.allDrugItem)..add(newItem);

// Emit the new state
    emit(DrugItemState(
      allDrugItem: updatedList,
    ));

    try {
      print(
          'Succesfully save of DrugItem ${state.allDrugItem.length}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
    } catch (e) {
      print('OMline DrugItem not created: $e !!!!!!!!!!!');
    }
  }

  Future<void> _onUpdateDrugItem(
      UpdateDrugItem event, Emitter<DrugItemState> emit) async {
    final state = this.state;
    final equipment_Item = event.Item;
    final index = state.allDrugItem.indexOf(equipment_Item);
    //update Locale storage
    List<DrugItem> allDrugItem = List.from(state.allDrugItem)..remove(DrugItem);
    allDrugItem.insert(index, equipment_Item.copyWith());
  }

  FutureOr<void> _onDeleteDrugItem(
      DeleteDrugItem event, Emitter<DrugItemState> emit) {}

  Future<void> _onFetchDrugItem(
      FetchDrugItems event, Emitter<DrugItemState> emit) async {
    final state = this.state;
    final response =
        // await http.get(Uri.parse('http://31.187.76.34:8090/equipment_Items'));
        await CallApi().getData('equipment_Items');

    if (response.statusCode == 200) {
      final List<dynamic> equipment_ItemsJson = json.decode(response.body);
      emit(DrugItemState(
          allDrugItem: equipment_ItemsJson
              .map((json) => DrugItem.fromJson(jsonEncode(json)))
              .toList()));
      print("successfull fetch of all DrugItem!!!!!!");
    } else {
      throw Exception('Failed to load equipment_Items');
    }
  }
}
