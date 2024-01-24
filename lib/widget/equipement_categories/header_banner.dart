import 'package:flutter/material.dart';

import '../../models/EquipementCategories.dart';
import 'header_content.dart';
import 'header_image.dart';

class HeaderBanner extends StatelessWidget {
  final EquipmentCategories equipment_categories;

  HeaderBanner(this.equipment_categories);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      child: Container(
        height: 300.0,
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              HeaderImage(this.equipment_categories.bannerUrl!),
              HeaderContent(this.equipment_categories),
            ],
          ),
        ),
      ),
    );
  }
}