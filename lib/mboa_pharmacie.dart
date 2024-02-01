import 'dart:async';
import 'package:get/get.dart';
import 'Theme/theme_export.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mboa_pharmacie/provider/provider.dart';
import 'package:mboa_pharmacie/resources/local_storage_key.dart';
import 'package:mboa_pharmacie/resources/export_app_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mboa_pharmacie/screens/Launching/ChoseLangaugeScreen.dart';
import 'package:mboa_pharmacie/services/localisationService/localization_service.dart';

void main() {
  runApp(const MboaPharmacie());
}

class MboaPharmacie extends StatefulWidget {
  const MboaPharmacie({Key? key}) : super(key: key);

  @override
  State<MboaPharmacie> createState() => _MboaPharmacie();
}

class _MboaPharmacie extends State<MboaPharmacie> {
  // This widget is the root of your application.
  final _storage = const FlutterSecureStorage();
  @override
  void initState() {
    _loadingProcess();
    super.initState();
  }

  final localizationController = Get.put(LocalizationController());

  Future<void> _loadingProcess() async {
    checkUserLoggedIn();
    //  context.read<EquipmentCategoriesBloc>().add(FetchEquipmentCategoriess());
  }

 

  Future<void> checkUserLoggedIn() async {
    final email = (await _storage.read(key: LocalStorageKey.EMAIL));
    // Check if email exists in storage to determine login state
    // print(email.runtimeType);
    print(email);
    email == null
        ? Provider.of<AppStatus>(context, listen: false)
            .changeLoginStatus(false)
        : Provider.of<AppStatus>(context, listen: false)
            .changeLoginStatus(true);

    print(
        "user status login is ${Provider.of<AppStatus>(context, listen: false).isLoggedIn}");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        init: localizationController,
        builder: (LocalizationController controller) {
          return MaterialApp(
              title: AppStrings.MboaPharmacieTitle,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: ThemeData(primarySwatch: Colors.blue),
              locale: controller.currentLanguage != ''
                  ? Locale(controller.currentLanguage, '')
                  : null,
              localeResolutionCallback:
                  LocalizationService.localeResolutionCallBack,
              supportedLocales: LocalizationService.supportedLocales,
              localizationsDelegates: LocalizationService.localizationsDelegate,
              home: Provider.of<AppStatus>(context).isConnected
                  ? const ChoseLangaugeScreen()
                  : Container(
                      color: Colors.white,
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            Text(
                              AppStrings.checkConnection,
                              style: AppTextTheme.title,
                            )
                          ]))
              // home: SignUp(),
              );
        });
  }
}
