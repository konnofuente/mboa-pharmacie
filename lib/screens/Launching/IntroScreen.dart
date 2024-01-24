import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/localisationService/localization_service.dart';
import 'ChoseLangaugeScreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final localizationController = Get.find<LocalizationController>();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ChoseLangaugeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Images/Logoevaltech1.png',
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
