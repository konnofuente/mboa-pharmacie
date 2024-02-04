import 'package:flutter/material.dart';
import 'package:mboa_pharmacie/models/DrugCategories.dart';
import 'package:mboa_pharmacie/screens/AllDrugCategories/components/all_drug_categoriesList.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<DrugCategories> classList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _gridView(),
    );
  }

  Widget _gridView() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(4.0),
      childAspectRatio: 8.0 / 9.0,
      children: classList
          .map(
            (Item) => AllDrugCategoriesList(equipment_categories: Item),
          )
          .toList(),
    );
  }
}
