import 'package:flutter/material.dart';
import 'package:mboa_pharmacie/mboa_pharmacie.dart';
import 'package:mboa_pharmacie/resources/strings_manager.dart';
import 'package:mboa_pharmacie/screens/AuthScreens/sign_in/signin_screen.dart';
import 'package:mboa_pharmacie/screens/Launching/ChoseLangaugeScreen.dart';
import 'package:mboa_pharmacie/screens/Launching/OnBoardingScreen.dart';

class Routes {
  static const String mboaPharmacieRoute = "/";
  static const String choseLanguageRoute = "/changeLangauge";
  static const String onBoardingRoute = "/onBoarding";
  static const String signInRoute = "/signIn";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mboaPharmacieRoute:
        return MaterialPageRoute(builder: (_) => MboaPharmacie());
      case Routes.choseLanguageRoute:
        return MaterialPageRoute(builder: (_) => ChoseLangaugeScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => SignIn());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound),
              ),
              body: Center(child: Text("No Route Found")),
            ));
  }
}
