import 'package:flutter/material.dart';
import 'components/get_item_list.dart';
import '../../models/DrugCategories.dart';
import 'package:mboa_pharmacie/widget/equipement_categories/header_banner.dart';
// ignore_for_file: prefer_const_constructors

class ListDrugItem extends StatelessWidget {
  final DrugCategories equipment_categories;

  ListDrugItem(this.equipment_categories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: Color.fromRGBO(245, 244, 244, 1),
      body: Column(
        children: <Widget>[
          Expanded(flex: 1, child: HeaderBanner(this.equipment_categories)),
          // Container(child: ListViewHome()),
          Expanded(
              flex: 2,
              child: GetItemList(
                equipmentCategory: this.equipment_categories,
              )),
        ],
        // ),
        //],
      ),
    );
  }
}
