// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mboa_pharmacie/models/Role.dart';
import 'package:flutter/material.dart';

import '../models/EquipementCategories.dart';
import '../models/User.dart';

class UserCreation with ChangeNotifier {
  User? userCreation;
  UserCreation({
    this.userCreation,
  });

  UserCreation copyWith({
    User? userCreation,
  }) {
    return UserCreation(
      userCreation: userCreation ?? this.userCreation,
    );
  }
}

class AppLang with ChangeNotifier {
  AppLang({
    required this.appLang,
  });

  String appLang;

  changeappLang(String langCode) {
    List<String> allLangCode = ['en', 'fr'];
    allLangCode.contains(langCode)
        ? appLang = langCode
        : print('no available langauge');
    notifyListeners();
  }
}

class AppStatus with ChangeNotifier {
  bool isConnected;
  bool isActExist;
  bool isLoggedIn;
  double? textsize = 20;
  Role? role;

  AppStatus({
    required this.isConnected,
    this.role,
    required this.isActExist,
    required this.textsize,
    required this.isLoggedIn,
  });

  changetextsize(double changeState) {
    textsize = changeState;
    notifyListeners();
  }

  changeLoginStatus(bool changeState) {
    isLoggedIn = changeState;
    notifyListeners();
  }

  setUserRole(int int) {
    int == 0 ? role = Role.ADMIN : role = Role.RESPONSABLE;
    print(role);
  }

  changeActExist(bool changeState) {
    isActExist = changeState;
    notifyListeners();
  }

  changeInternetConnectionStatus(bool changeState) {
    isConnected = changeState;
    notifyListeners();
  }
}

class EquipmentCategoriesState with ChangeNotifier {
  EquipmentCategoriesState({
    required this.equipment_categories,
  });

  EquipmentCategories? equipment_categories;

  setGlobalEquipmentCategories(EquipmentCategories val) {
    equipment_categories = val;
    notifyListeners();
  }
}
