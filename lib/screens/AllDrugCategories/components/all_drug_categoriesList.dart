import 'dart:io';
import '../../../models/Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider.dart';
import '../../../models/DrugCategories.dart';
import 'package:mboa_pharmacie/Theme/text_theme.dart';
import 'package:mboa_pharmacie/screens/Home/GetRatings.dart';
import 'package:mboa_pharmacie/screens/DrugCategory/drug_category.dart';

class AllDrugCategoriesList extends StatefulWidget {
  final DrugCategories equipment_categories;

  const AllDrugCategoriesList({required this.equipment_categories});

  @override
  State<AllDrugCategoriesList> createState() => _AllDrugCategoriesListState();
}

class _AllDrugCategoriesListState extends State<AllDrugCategoriesList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<DrugCategoriesState>(context, listen: false)
            .setGlobalDrugCategories(widget.equipment_categories);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DrugCategoryScreen(),
          ),
        );
      },
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 12.0,
              child: widget.equipment_categories.imageUrl != null
                  ? Image.file(File(widget.equipment_categories.imageUrl!),
                      fit: BoxFit.cover)
                  : SizedBox
                      .shrink(), // Replace with a placeholder widget if you like
            ),
            // ignore: unnecessary_new
            new Padding(
              padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(widget.equipment_categories.name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextTheme.gridlisttitle),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Text(widget.equipment_categories.directors!,
                  //     style: AppTextTheme.caption),
                  SizedBox(height: 2.0),
                  Center(child: GetRatings()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
