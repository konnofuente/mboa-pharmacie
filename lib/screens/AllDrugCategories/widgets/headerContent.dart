import '../../../models/Item.dart';
import '../../Home/GetRatings.dart';
import 'package:flutter/material.dart';
import '../../../Theme/theme_export.dart';
import 'package:mboa_pharmacie/screens/AllDrugCategories/widgets/movieDesc.dart';

class HeaderContent extends StatelessWidget {
  final Item equipment_categories;

  HeaderContent(this.equipment_categories);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(equipment_categories.name,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.gridlisttitle),
                  Text(
                    equipment_categories.category,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 9.0,
                    ),
                  ),
                  GetRatings(),
                  MovieDesc(this.equipment_categories),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
