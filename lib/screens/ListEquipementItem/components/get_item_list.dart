import 'package:mboa_pharmacie/Theme/theme_export.dart';
import 'package:flutter/material.dart';

import '../../../models/EquipementCategories.dart';
import '../../../models/EquipementItem.dart';
import '../../../utils/navigate_screen.dart';

class GetItemList extends StatelessWidget {
  final EquipmentCategories equipmentCategory;

  GetItemList({required this.equipmentCategory});

  @override
  Widget build(BuildContext context) {
    List<EquipmentItem> itemsList = equipmentCategory.items;

    if (itemsList.isEmpty) {
      return Center(
        child: Text(
          'No items were created yet.',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
      );
    }

    return Expanded(
        flex: 1,
        child: Container(
            margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
            height: 800.0,
            child: ListView.builder(
              itemCount: itemsList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () async {
                      // NavigationScreen.navigate(
                      //     context,
                      //     PDFViewerScreen(
                      //       pdfUrl: itemsList[index].url,
                      //       // pdfFile: pdfFile,
                      //     ));
                    },
                    title: Text(
                      itemsList[index].name,
                      style: AppTextTheme.listtitle,
                    ),
                    subtitle: Text(itemsList[index].quantity.toString()),
                    leading: Icon(
                      Icons.inventory,
                      // size: 40.0,
                      color: Colors.blue,
                    ),
                  ),
                );
              },
            )));
  }
}
