import 'package:flutter/material.dart';
import 'package:mboa_pharmacie/models/enum.dart';
import 'package:mboa_pharmacie/screens/Projet/projet.dart';
import 'package:mboa_pharmacie/screens/SettingScreen/Settings.dart';
import 'package:mboa_pharmacie/screens/Home/DashBaord/DashBoard.dart';


AppDrawerTitle screen = AppDrawerTitle.Home;
Widget getDashboardFragment(int selectedIndex) {
  if (selectedIndex == 0) {
    return ProjetScreen();
  } else if (selectedIndex == 1) {
    return ProjetScreen();
  } else if (selectedIndex == 2) {
    return ProjetScreen();
  }
  return ProjetScreen();
}

Widget getHomeFragment(AppDrawerTitle val) {
  if (val == AppDrawerTitle.Setting) {
    return SettingScreen();
  } else {
    return DashBoard();
  }
}
