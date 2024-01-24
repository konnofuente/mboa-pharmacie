import 'package:flutter/material.dart';

abstract class AppColors {
  static const primaryblue = Color.fromRGBO(11, 119, 219, 1);
  static const lightprimaryblue = Color.fromRGBO(11, 119, 219, 0.8);
  static const primarydark = Color.fromRGBO(8, 83, 153, 1);
  static const icon = Color.fromRGBO(230, 230, 230, 1);
  static const bottomtap = Color.fromRGBO(242, 242, 242, 1);
  static const labelText = Color.fromRGBO(90 , 91, 91, 1);
  static const gray = Color.fromRGBO(11126, 141, 155, 1);
  static const success = Color.fromRGBO(0,159,6,1);
  static const danger = Color.fromARGB(255, 164, 45, 2);
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const black = Color.fromRGBO(0, 0, 0, 1);

}

class MyTheme{
  static final darkTheme= ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    primarySwatch: Colors.blue,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    primarySwatch:Colors.blue,

  );

}