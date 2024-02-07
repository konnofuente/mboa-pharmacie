import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/provider.dart';
import '../../../models/DrugCategories.dart';
import 'package:mboa_pharmacie/Theme/text_theme.dart';
import 'package:mboa_pharmacie/Theme/theme_export.dart';
import 'package:mboa_pharmacie/resources/style_manager.dart';
import 'package:mboa_pharmacie/resources/value_manager.dart';
import 'package:mboa_pharmacie/screens/Home/GetRatings.dart';






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

      },
      child: Container(
        child: Card(
          elevation: AppSize.s1_5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s10),
          ),
          color: AppColors.white, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: AppSize.s18 / AppSize.s12,
                child: widget.equipment_categories.imageUrl != null
                    ? Image.network(widget.equipment_categories.imageUrl!,
                        fit: BoxFit.cover)
                    : SizedBox
                        .shrink(), // Replace with a placeholder widget if you like
              ),
              // ignore: unnecessary_new
              new Padding(
                padding: getLTRBPadding(AppSize.s4, AppSize.s4, AppSize.s0,AppSize.s2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: AppSize.s4,
                    ),
                    Center(
                      child: Text(widget.equipment_categories.name,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppTextTheme.gridlisttitle),
                    ),
                    SizedBox(
                      height: AppSize.s4,
                    ),
                    SizedBox(height: AppSize.s2),
                    Center(child: GetRatings()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
