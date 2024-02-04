import 'mboa_pharmacie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mboa_pharmacie/bloc/bloc_export.dart';
import 'package:mboa_pharmacie/resources/route_manager.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// ignore_for_file: prefer_const_constructors

class MyApp extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp._internal();
  int appState = 0;

  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => DrugCategoriesBloc(),
        ),
      ],
      child: GetMaterialApp(
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.mboaPharmacieRoute,
        onUnknownRoute: (settings) => RouteGenerator.unDefinedRoute(),
      ),
    );
  }
}
