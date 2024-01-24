import 'package:mboa_pharmacie/app.dart';
import 'package:mboa_pharmacie/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppLang(appLang: 'fr')),
      ChangeNotifierProvider(create: (_) => UserCreation()),
      ChangeNotifierProvider(
          create: (_) => EquipmentCategoriesState(equipment_categories: null)),

      ChangeNotifierProvider(
          create: (_) => AppStatus(
              isConnected: true,
              role: null,
              isActExist: false,
              isLoggedIn: false,
              textsize: 10)),
              
    ], child: MyApp())),
  );
}


