import 'font_manager.dart';
import 'package:flutter/cupertino.dart';


TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight,Color color) {
  return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      );
}

//regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily,  FontWeightManager.regular , color);
}


// light text style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}
// bold text style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

// semi bold text style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}


// medium text style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}



//PADDING !!!

EdgeInsetsGeometry getLTRBPadding(double left, double top, double right, double bottom) {
  return EdgeInsets.fromLTRB(left, top, right, bottom);
}

EdgeInsetsGeometry getSymmetricPadding(double vertical, double horizontal,) {
  return EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
}
EdgeInsetsGeometry getLTRPadding(
   double left ,  double top, double right ) {
  return getLTRBPadding(left, top, right, 0);
}
EdgeInsetsGeometry getRegularPadding(
  {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
  return getLTRBPadding(left, top, right, bottom);
}

EdgeInsetsGeometry getHorizontalPadding(double value) {
  return getLTRBPadding(value, 0, value, 0);
}

EdgeInsetsGeometry getVerticalPadding(double value) {
  return getLTRBPadding(0, value, 0, value);
}

EdgeInsetsGeometry getAllPadding(double value) {
  return getLTRBPadding(value, value, value, value);
}
