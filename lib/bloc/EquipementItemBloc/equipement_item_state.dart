import 'package:equatable/equatable.dart';
import '../../models/EquipementItem.dart';

class EquipmentItemState extends Equatable {
  final List<EquipmentItem> allEquipmentItem;
  const EquipmentItemState({
    this.allEquipmentItem = const <EquipmentItem>[],
  });

  @override
  List<Object> get props => [allEquipmentItem];
}
