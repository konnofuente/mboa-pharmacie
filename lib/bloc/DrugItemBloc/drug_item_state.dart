import '../../models/DrugItem.dart';
import 'package:equatable/equatable.dart';

class DrugItemState extends Equatable {
  final List<DrugItem> allDrugItem;
  const DrugItemState({
    this.allDrugItem = const <DrugItem>[],
  });

  @override
  List<Object> get props => [allDrugItem];
}
