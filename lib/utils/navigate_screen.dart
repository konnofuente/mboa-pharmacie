import 'package:flutter/material.dart';
import '../Theme/app_theme.dart';

class NavigationScreen {
  // WidgetIcon._();
  static void  navigate(BuildContext context,Widget screen){
       Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
  }
  static void  replaceNavigate(BuildContext context,Widget screen){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  screen ));
  }
}
