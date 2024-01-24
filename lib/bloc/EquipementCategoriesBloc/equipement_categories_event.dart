import 'package:equatable/equatable.dart';
import 'package:mboa_pharmacie/models/EquipementItem.dart';

import '../../models/EquipementCategories.dart';

abstract class EquipmentCategoriesEvent extends Equatable {
  const EquipmentCategoriesEvent();

  @override
  List<Object> get props => [];
}

class AddEquipmentCategories extends EquipmentCategoriesEvent {
  final EquipmentCategories EquipmentCategory;
  const AddEquipmentCategories({
    required this.EquipmentCategory,
  });
  @override
  List<Object> get props => [EquipmentCategory];
}

class AddItemEquipmentCategories extends EquipmentCategoriesEvent {
  final EquipmentCategories EquipmentCategory;
  final EquipmentItem Item;
  const AddItemEquipmentCategories({
    required this.Item,
    required this.EquipmentCategory,
  });
  @override
  List<Object> get props => [EquipmentCategory];
}

class UpdateEquipmentCategories extends EquipmentCategoriesEvent {
  final EquipmentCategories EquipmentCategory;
  const UpdateEquipmentCategories({
    required this.EquipmentCategory,
  });
  @override
  List<Object> get props => [EquipmentCategory];
}

class DeleteEquipmentCategories extends EquipmentCategoriesEvent {
  final EquipmentCategories EquipmentCategory;
  const DeleteEquipmentCategories({
    required this.EquipmentCategory,
  });
  @override
  List<Object> get props => [EquipmentCategory];
}

class FetchEquipmentCategoriess extends EquipmentCategoriesEvent {
  // final EquipmentCategories EquipmentCategoriess;
  // const FetchEquipmentCategoriess({
  //   required this.EquipmentCategoriess,
  // });
  // @override
  // List<Object> get props => [EquipmentCategoriess];
}
