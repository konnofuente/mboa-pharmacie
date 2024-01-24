import 'package:equatable/equatable.dart';

import '../../models/EquipementItem.dart';



abstract class EquipmentItemEvent extends Equatable {
  const EquipmentItemEvent();

  @override
  List<Object> get props => [];
}

class AddEquipmentItem extends EquipmentItemEvent {
  final EquipmentItem Item;
  const AddEquipmentItem({
    required this.Item, 
  });
  @override
  List<Object> get props => [Item];
}

class UpdateEquipmentItem extends EquipmentItemEvent {
  final EquipmentItem Item;
  const UpdateEquipmentItem({
    required this.Item,
  });
  @override
  List<Object> get props => [Item];
}

class DeleteEquipmentItem extends EquipmentItemEvent {
  final EquipmentItem Item;
  const DeleteEquipmentItem({
    required this.Item,
  });
  @override
  List<Object> get props => [Item];
}

class FetchEquipmentItems extends EquipmentItemEvent {
  // final EquipmentItem EquipmentItems;
  // const FetchEquipmentItems({
  //   required this.EquipmentItems,
  // });
  // @override
  // List<Object> get props => [EquipmentItems];
}
