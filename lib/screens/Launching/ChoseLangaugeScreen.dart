import 'package:get/get.dart';
import 'OnBoardingScreen.dart';
import '../../Theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:mboa_pharmacie/utils/navigate_screen.dart';
import 'package:mboa_pharmacie/resources/route_manager.dart';
import 'package:mboa_pharmacie/resources/style_manager.dart';
import 'package:mboa_pharmacie/resources/value_manager.dart';
import 'package:mboa_pharmacie/resources/assets_manager.dart';
import '../../services/localisationService/localization_service.dart';
import 'package:mboa_pharmacie/services/localisationService/t_key.dart';

class ChoseLangaugeScreen extends StatefulWidget {
  const ChoseLangaugeScreen({Key? key}) : super(key: key);

  @override
  State<ChoseLangaugeScreen> createState() => _ChoseLangaugeScreenState();
}

class _ChoseLangaugeScreenState extends State<ChoseLangaugeScreen> {
  final localizationController = Get.find<LocalizationController>();
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: _inProgress
              // ignore: prefer_const_constructors
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: getLTRPadding(AppPadding.p70,
                                  AppPadding.p300, AppPadding.p70),
                              child: Text(
                                TKeys.chose_lang.translate(context),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppTextTheme.title,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {},
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getLTRPadding(AppPadding.p80,
                                    AppPadding.p50, AppPadding.p80),
                                child: TextButton.icon(
                                  label: Text(
                                    TKeys.en.translate(context),
                                    style: AppTextTheme.listtitle,
                                  ),
                                  onPressed: () async {
                                    await localizationController
                                        .toggleLanguage('en');
                                    print(_inProgress);
                                    print(Routes.onBoardingRoute);

                                    NavigationScreen.navigate(
                                        context, OnBoardingScreen());
                                  },
                                  icon: Image.asset(
                                    ImageAssets.enFlag,
                                  ),
                                )),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getLTRPadding(AppPadding.p80,
                                      AppPadding.p50, AppPadding.p80),
                                  child: TextButton.icon(
                                    onPressed: () async {
                                      await localizationController
                                          .toggleLanguage('fr');

                                      print(_inProgress);

                                      NavigationScreen.navigate(
                                          context, OnBoardingScreen());
                                    },
                                    icon: Image.asset(ImageAssets.frFlag),
                                    label: Text(
                                      TKeys.fr.translate(context),
                                      style: AppTextTheme.listtitle,
                                    ),
                                  )),
                            ),
                          )
                          ,
                   
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
