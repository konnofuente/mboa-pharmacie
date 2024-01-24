// ignore_for_file: prefer_const_constructors
import 'package:mboa_pharmacie/widget/equipement_categories/header_banner.dart';
import 'package:flutter/material.dart';

import '../../models/EquipementCategories.dart';
import 'components/get_item_list.dart';

class ListEquipementItem extends StatelessWidget {
  final EquipmentCategories equipment_categories;

  ListEquipementItem(this.equipment_categories);

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
