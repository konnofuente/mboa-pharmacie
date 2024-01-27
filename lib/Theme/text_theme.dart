import 'app_theme.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'raleway';

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;

  static const TextTheme textTheme = TextTheme(
    headline3: bigtitle,
    headline4: header,
    headline5: title,
    headline6: appbartitle,
    subtitle1: gridlisttitle,
    subtitle2: listtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
    button: buttonwhite,
    headline2: buttonblack,
    overline: link,
  );

  static const TextStyle bigtitle = TextStyle(
    //h3->bigtitle
    // h4 -> headline4
    fontFamily: fontName,
    fontWeight: bold,
    fontSize: 40,
    letterSpacing: 0.0,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle header = TextStyle(
    //h4
    // h4 -> headline4
    fontFamily: fontName,
    fontWeight: bold,
    fontSize: 30,
    letterSpacing: 0.25,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    //h5
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: bold,
    fontSize: 25,
    letterSpacing: -1,
    color: darkerText,
  );

  static const TextStyle appbartitle = TextStyle(
    //h6-
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: medium,
    fontSize: 20,
    letterSpacing: 0.15,
    color: AppColors.white,
  );

  static const TextStyle gridlisttitle = TextStyle(
    //subtitle1
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: bold,
    fontSize: 20,
    letterSpacing: 0.15,
    color: AppColors.black,
  );

  static const TextStyle listtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: bold,
    fontSize: 14,
    letterSpacing: 0.1,
    color: AppColors.black,
  );
  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: AppColors.black,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: AppColors.black,
  );

  static const TextStyle link = TextStyle(
      // body1 -> body2
      fontFamily: fontName,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0.2,
      color: AppColors.primary);

  static const TextStyle buttonwhite = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: bold,
    fontSize: 16,
    letterSpacing: 1.25,
    color: AppColors.white,
  );
  static const TextStyle buttonblack = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: regular,
    fontSize: 16,
    letterSpacing: 1.25,
    color: AppColors.black,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: regular,
    fontSize: 10,
    letterSpacing: 0.2,
    color: AppColors.gray, // was lightText
  );
}
