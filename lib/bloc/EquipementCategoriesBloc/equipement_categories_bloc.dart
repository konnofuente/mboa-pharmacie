import 'dart:async';
import 'dart:convert';

import 'package:mboa_pharmacie/bloc/EquipementCategoriesBloc/equipement_categories_event.dart';
import 'package:mboa_pharmacie/bloc/EquipementCategoriesBloc/equipement_categories_state.dart';
import 'package:mboa_pharmacie/models/EquipementCategories.dart';
import 'package:mboa_pharmacie/models/EquipementCategories.dart';
import 'package:mboa_pharmacie/models/EquipementItem.dart';
import 'package:mboa_pharmacie/models/function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/EquipementCategories.dart';
import '../../services/callApi.dart';
import 'package:http/http.dart' as http;

class EquipmentCategoriesBloc
    extends Bloc<EquipmentCategoriesEvent, EquipmentCategoriesState> {
  EquipmentCategoriesBloc() : super(const EquipmentCategoriesState()) {
    on<AddEquipmentCategories>(_onAddEquipmentCategories);
    on<AddItemEquipmentCategories>(_onAddItemEquipmentCategories);
    on<UpdateEquipmentCategories>(_onUpdateEquipmentCategories);
    on<DeleteEquipmentCategories>(_onDeleteEquipmentCategories);
    // on<FetchEquipmentCategories>(_onFetchEquipmentCategories);
  }

  Future<FutureOr<void>> _onAddEquipmentCategories(AddEquipmentCategories event,
      Emitter<EquipmentCategoriesState> emit) async {
    // Use the current state
    final currentState = this.state;

    // Generate unique ID for new EquipmentCategory
    int Id = AppFunction().generateUserId(event.EquipmentCategory.name);

    // Create a new EquipmentCategories object with generated ID
    EquipmentCategories newEquipmentCategory =
        event.EquipmentCategory.copyWith(id: Id);

    // Create a new list that includes all previous elements and the new one
    List<EquipmentCategories> updatedEquipmentCategories =
        List.from(currentState.allEquipmentCategories)
          ..add(newEquipmentCategory);

    // Emit the new state
    emit(EquipmentCategoriesState(
      allEquipmentCategories: updatedEquipmentCategories,
    ));

    try {
      print(
          'Successfully saved EquipmentCategories as the ${updatedEquipmentCategories.length}th ');
    } catch (e) {
      print('Online EquipmentCategories not created: $e');
    }
  }

  Future<FutureOr<void>> _onAddItemEquipmentCategories(
    AddItemEquipmentCategories event,
    Emitter<EquipmentCategoriesState> emit,
  ) async {
    try {
      // Fetch the current state
      final currentState = this.state;

      // Find the target EquipmentCategory by ID or some other unique identifier
      final targetCategory = currentState.allEquipmentCategories.firstWhere(
        (category) => category.id == event.EquipmentCategory.id,
      );

      // Add the new item to the target category
      final List<EquipmentItem> updatedItems = List.from(targetCategory.items)
        ..add(event.Item);

      // Create a new EquipmentCategory object with the updated items list
      final updatedCategory = targetCategory.copyWith(items: updatedItems);

      // Create a new list of EquipmentCategories including the updated category
      final updatedEquipmentCategories =
          currentState.allEquipmentCategories.map((category) {
        return category.id == updatedCategory.id ? updatedCategory : category;
      }).toList();

      // Emit the new state
      emit(EquipmentCategoriesState(
        allEquipmentCategories: updatedEquipmentCategories,
      ));

      final newCategory = currentState.allEquipmentCategories.firstWhere(
        (category) => category.id == event.EquipmentCategory.id,
      );
      print(
          'Successfully added item to EquipmentCategory ${newCategory.items} !');
    } catch (e) {
      print('Failed to add item to EquipmentCategory: $e');
    }
  }

  Future<void> _onUpdateEquipmentCategories(UpdateEquipmentCategories event,
      Emitter<EquipmentCategoriesState> emit) async {
    final state = this.state;
    final equipment_categories = event.EquipmentCategory;
    final index = state.allEquipmentCategories.indexOf(equipment_categories);
    //update Locale storage
    List<EquipmentCategories> allEquipmentCategories =
        List.from(state.allEquipmentCategories)..remove(EquipmentCategories);
    allEquipmentCategories.insert(index, equipment_categories.copyWith());
  }

  FutureOr<void> _onDeleteEquipmentCategories(DeleteEquipmentCategories event,
      Emitter<EquipmentCategoriesState> emit) {}

  Future<void> _onFetchEquipmentCategories(FetchEquipmentCategoriess event,
      Emitter<EquipmentCategoriesState> emit) async {
    final state = this.state;
    final response =
        // await http.get(Uri.parse('http://31.187.76.34:8090/equipment_categoriess'));
        await CallApi().getData('equipment_categoriess');

    if (response.statusCode == 200) {
      final List<dynamic> equipment_categoriessJson =
          json.decode(response.body);
      emit(EquipmentCategoriesState(
          allEquipmentCategories: equipment_categoriessJson
              .map((json) => EquipmentCategories.fromJson(jsonEncode(json)))
              .toList()));
      print("successfull fetch of all EquipmentCategories!!!!!!");
    } else {
      throw Exception('Failed to load equipment_categoriess');
    }
  }
}
