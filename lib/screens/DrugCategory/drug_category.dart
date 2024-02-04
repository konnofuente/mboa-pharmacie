import '../../Theme/app_theme.dart';
import '../../provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/DrugCategories.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:mboa_pharmacie/screens/ItemReservation/item_reservation.dart';
import 'package:mboa_pharmacie/screens/DrugCategory/widgets/getBottomItem.dart';
import 'package:mboa_pharmacie/screens/ListEquipementItem/list_equipement_item.dart';
import 'package:mboa_pharmacie/screens/DrugCategory/components/add_form_drug_item.dart';

// ignore_for_file: prefer_const_constructors

class DrugCategoryScreen extends StatefulWidget {
  // final Item item;
  // DrugCategoryScreen(this.item);
  DrugCategoryScreen();

  @override
  State<DrugCategoryScreen> createState() => _DrugCategoryScreenState();
}

class _DrugCategoryScreenState extends State<DrugCategoryScreen> {
  //  DrugCategoryScreen({Key? key, required this.item}) : super(key: key);
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  int selectedIndex = 0;

  String AppBarTitle = 'evaltech';

  @override
  void initState() {
    // setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DrugCategories globalItem = Provider.of<DrugCategoriesState>(context)
        .equipment_categories as DrugCategories;

    Widget getFragment() {
      if (selectedIndex == 0) {
        return ListDrugItem(globalItem);
      } else if (selectedIndex == 1) {
        return AddFormDrugItem(
          equipmentCategory: globalItem,
        );
      } else if (selectedIndex == 2) {
        return ItemReservation();
      }
      return ListDrugItem(globalItem);
    }

    return Scaffold(
      body: getFragment(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(0),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.bottomtap,
          items: getBottomItem(context),
          onTap: (val) {
            // AppBarName();
            setState(() {
              selectedIndex = val;
            });
            print(selectedIndex);
          },
          currentIndex: selectedIndex,
        ),
      ),
    );
  }
}
