import '../../models/DrugItem.dart';
import 'package:equatable/equatable.dart';

abstract class DrugItemEvent extends Equatable {
  const DrugItemEvent();

  @override
  List<Object> get props => [];
}

class AddDrugItem extends DrugItemEvent {
  final DrugItem Item;
  const AddDrugItem({
    required this.Item,
  });
  @override
  List<Object> get props => [Item];
}

class UpdateDrugItem extends DrugItemEvent {
  final DrugItem Item;
  const UpdateDrugItem({
    required this.Item,
  });
  @override
  List<Object> get props => [Item];
}

class DeleteDrugItem extends DrugItemEvent {
  final DrugItem Item;
  const DeleteDrugItem({
    required this.Item,
  });
  @override
  List<Object> get props => [Item];
}

class FetchDrugItems extends DrugItemEvent {
  // final DrugItem DrugItems;
  // const FetchDrugItems({
  //   required this.DrugItems,
  // });
  // @override
  // List<Object> get props => [DrugItems];
}
