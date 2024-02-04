import 'package:equatable/equatable.dart';
import '../../models/DrugCategories.dart';
import 'package:mboa_pharmacie/models/DrugItem.dart';

abstract class DrugCategoriesEvent extends Equatable {
  const DrugCategoriesEvent();

  @override
  List<Object> get props => [];
}

class AddDrugCategories extends DrugCategoriesEvent {
  final DrugCategories DrugCategory;
  const AddDrugCategories({
    required this.DrugCategory,
  });
  @override
  List<Object> get props => [DrugCategory];
}

class AddItemDrugCategories extends DrugCategoriesEvent {
  final DrugCategories DrugCategory;
  final DrugItem Item;
  const AddItemDrugCategories({
    required this.Item,
    required this.DrugCategory,
  });
  @override
  List<Object> get props => [DrugCategory];
}

class UpdateDrugCategories extends DrugCategoriesEvent {
  final DrugCategories DrugCategory;
  const UpdateDrugCategories({
    required this.DrugCategory,
  });
  @override
  List<Object> get props => [DrugCategory];
}

class DeleteDrugCategories extends DrugCategoriesEvent {
  final DrugCategories DrugCategory;
  const DeleteDrugCategories({
    required this.DrugCategory,
  });
  @override
  List<Object> get props => [DrugCategory];
}

class FetchDrugCategoriess extends DrugCategoriesEvent {
  // final DrugCategories DrugCategoriess;
  // const FetchDrugCategoriess({
  //   required this.DrugCategoriess,
  // });
  // @override
  // List<Object> get props => [DrugCategoriess];
}
