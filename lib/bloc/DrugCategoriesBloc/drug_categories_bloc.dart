import 'dart:async';
import 'dart:convert';
import '../../services/callApi.dart';
import 'package:http/http.dart' as http;
import '../../models/DrugCategories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mboa_pharmacie/models/DrugItem.dart';
import 'package:mboa_pharmacie/models/function.dart';
import 'package:mboa_pharmacie/models/DrugCategories.dart';
import 'package:mboa_pharmacie/models/DrugCategories.dart';
import 'package:mboa_pharmacie/bloc/DrugCategoriesBloc/drug_categories_event.dart';
import 'package:mboa_pharmacie/bloc/DrugCategoriesBloc/drug_categories_state.dart';

class DrugCategoriesBloc
    extends Bloc<DrugCategoriesEvent, DrugCategoriesState> {
  DrugCategoriesBloc() : super(const DrugCategoriesState()) {
    on<AddDrugCategories>(_onAddDrugCategories);
    on<AddItemDrugCategories>(_onAddItemDrugCategories);
    on<UpdateDrugCategories>(_onUpdateDrugCategories);
    on<DeleteDrugCategories>(_onDeleteDrugCategories);
    // on<FetchDrugCategories>(_onFetchDrugCategories);
  }

  Future<FutureOr<void>> _onAddDrugCategories(
      AddDrugCategories event, Emitter<DrugCategoriesState> emit) async {
    // Use the current state
    final currentState = this.state;

    // Generate unique ID for new DrugCategory
    int Id = AppFunction().generateUserId(event.DrugCategory.name);

    // Create a new DrugCategories object with generated ID
    DrugCategories newDrugCategory = event.DrugCategory.copyWith(id: Id);

    // Create a new list that includes all previous elements and the new one
    List<DrugCategories> updatedDrugCategories =
        List.from(currentState.allDrugCategories)..add(newDrugCategory);

    // Emit the new state
    emit(DrugCategoriesState(
      allDrugCategories: updatedDrugCategories,
    ));

    try {
      print(
          'Successfully saved DrugCategories as the ${updatedDrugCategories.length}th ');
    } catch (e) {
      print('Online DrugCategories not created: $e');
    }
  }

  Future<FutureOr<void>> _onAddItemDrugCategories(
    AddItemDrugCategories event,
    Emitter<DrugCategoriesState> emit,
  ) async {
    try {
      // Fetch the current state
      final currentState = this.state;

      // Find the target DrugCategory by ID or some other unique identifier
      final targetCategory = currentState.allDrugCategories.firstWhere(
        (category) => category.id == event.DrugCategory.id,
      );

      // Add the new item to the target category
      final List<DrugItem> updatedItems = List.from(targetCategory.items)
        ..add(event.Item);

      // Create a new DrugCategory object with the updated items list
      final updatedCategory = targetCategory.copyWith(items: updatedItems);

      // Create a new list of DrugCategories including the updated category
      final updatedDrugCategories =
          currentState.allDrugCategories.map((category) {
        return category.id == updatedCategory.id ? updatedCategory : category;
      }).toList();

      // Emit the new state
      emit(DrugCategoriesState(
        allDrugCategories: updatedDrugCategories,
      ));

      final newCategory = currentState.allDrugCategories.firstWhere(
        (category) => category.id == event.DrugCategory.id,
      );
      print('Successfully added item to DrugCategory ${newCategory.items} !');
    } catch (e) {
      print('Failed to add item to DrugCategory: $e');
    }
  }

  Future<void> _onUpdateDrugCategories(
      UpdateDrugCategories event, Emitter<DrugCategoriesState> emit) async {
    final state = this.state;
    final equipment_categories = event.DrugCategory;
    final index = state.allDrugCategories.indexOf(equipment_categories);
    //update Locale storage
    List<DrugCategories> allDrugCategories = List.from(state.allDrugCategories)
      ..remove(DrugCategories);
    allDrugCategories.insert(index, equipment_categories.copyWith());
  }

  FutureOr<void> _onDeleteDrugCategories(
      DeleteDrugCategories event, Emitter<DrugCategoriesState> emit) {}

  Future<void> _onFetchDrugCategories(
      FetchDrugCategoriess event, Emitter<DrugCategoriesState> emit) async {
    final state = this.state;
    final response =
        // await http.get(Uri.parse('http://31.187.76.34:8090/equipment_categoriess'));
        await CallApi().getData('equipment_categoriess');

    if (response.statusCode == 200) {
      final List<dynamic> equipment_categoriessJson =
          json.decode(response.body);
      emit(DrugCategoriesState(
          allDrugCategories: equipment_categoriessJson
              .map((json) => DrugCategories.fromJson(jsonEncode(json)))
              .toList()));
      print("successfull fetch of all DrugCategories!!!!!!");
    } else {
      throw Exception('Failed to load equipment_categoriess');
    }
  }
}
