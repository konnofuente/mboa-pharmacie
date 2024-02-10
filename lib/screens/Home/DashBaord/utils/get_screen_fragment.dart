import 'package:flutter/material.dart';
import 'package:mboa_pharmacie/models/enum.dart';
import 'package:mboa_pharmacie/screens/SettingScreen/Settings.dart';
import 'package:mboa_pharmacie/screens/LandingPage/landingPage.dart';
import 'package:mboa_pharmacie/screens/Home/DashBaord/DashBoard.dart';
import 'package:mboa_pharmacie/screens/Consultation/consultants_list_page.dart';
import 'package:mboa_pharmacie/screens/AllDrugCategories/all_drug_categoryScreen.dart';
import 'package:mboa_pharmacie/screens/AllDrugCategories/components/medical_prescription.dart';


AppDrawerTitle screen = AppDrawerTitle.Home;
Widget getDashboardFragment(int selectedIndex) {
  if (selectedIndex == 0) {
    return AllDrugCategoryScreen();
  } else if (selectedIndex == 1) {
    return LandingPage();
  } else if (selectedIndex == 2) {
    return ConsultantsListPage();
  } else if (selectedIndex == 3) {
    return MedicalPrescription();
    
  }
  return LandingPage();
}

Widget getHomeFragment(AppDrawerTitle val) {
  if (val == AppDrawerTitle.Setting) {
    return SettingScreen();
  } else {
    return DashBoard();
  }
}
