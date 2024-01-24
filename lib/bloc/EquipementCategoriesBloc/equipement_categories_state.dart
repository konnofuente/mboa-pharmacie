import 'package:equatable/equatable.dart';

import '../../models/EquipementCategories.dart';

class EquipmentCategoriesState extends Equatable {
  final List<EquipmentCategories> allEquipmentCategories;
  const EquipmentCategoriesState({
    this.allEquipmentCategories = const <EquipmentCategories>[],
  });

  @override
  List<Object> get props => [allEquipmentCategories];
}
