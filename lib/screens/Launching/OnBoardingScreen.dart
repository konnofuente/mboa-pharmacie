import '../Home/home.dart';
import '../../Theme/app_theme.dart';
import '../../Theme/text_theme.dart';
import '../../provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/navigate_screen.dart';
import '../../services/localisationService/t_key.dart';
import 'package:mboa_pharmacie/utils/image_formatter.dart';
import 'package:mboa_pharmacie/resources/assets_manager.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mboa_pharmacie/screens/Launching/ChoseUserMode.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var listPagesViewModel = [
      PageViewModel(
        title: TKeys.splash_title_1.translate(context),
        body: TKeys.splash_text_1.translate(context),
        image: ImageFormatter.buildImageSvg(ImageAssets.onboardingLogo1),
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        title: TKeys.splash_title_2.translate(context),
        body: TKeys.splash_text_2.translate(context),
        image: ImageFormatter.buildImageSvg(ImageAssets.onboardingLogo2),
        decoration: getPageDecoration(),
      ),
      PageViewModel(
        title: TKeys.splash_title_3.translate(context),
        // body: 'body3',
        body: TKeys.splash_text_3.translate(context),
        image: ImageFormatter.buildImageSvg(ImageAssets.onboardingLogo3, 500),
        decoration: getPageDecoration(),
      ),
    ];

    return SafeArea(
      child: IntroductionScreen(
        pages: listPagesViewModel,
        showSkipButton: true,
        skip: Text(
          TKeys.skip.translate(context),
          style: AppTextTheme.buttonblack,
        ),
        done: Text(
          TKeys.done.translate(context),
          style: AppTextTheme.buttonblack,
        ),
        onDone: () {
          Provider.of<AppStatus>(context, listen: false).isLoggedIn == false
              ? NavigationScreen.navigate(context, ChoseUserMode())
              : NavigationScreen.navigate(context, Home());
        },
        onSkip: () {
          Provider.of<AppStatus>(context, listen: false).isLoggedIn == false
              ? NavigationScreen.navigate(context, ChoseUserMode())
              : NavigationScreen.navigate(context, Home());
        },
        next: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
        animationDuration: 400,
        dotsDecorator: getdotdecorator(),
      ),
    );
  }


  DotsDecorator getdotdecorator() => const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: AppColors.primary,
        color: Color(0xFFBDBDBD),
        activeSize: Size(42.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: AppTextTheme.title,
        bodyTextStyle: TextStyle(fontSize: 15, color: Colors.grey),
        bodyPadding: EdgeInsets.all(20),
        imagePadding: EdgeInsets.all(24),
      );
}
