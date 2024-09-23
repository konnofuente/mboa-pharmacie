import '../Theme/app_theme.dart';
import 'package:flutter/material.dart';

class WidgetButton {
  // WidgetIcon._();
  static ElevatedButton largeButton(String text, TextStyle textStyle,
      Color backgroundColor, Widget? logo, void Function() onpressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: backgroundColor,
          fixedSize: const Size(350, 50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo == null ? Container() : logo,
          SizedBox(
            width: 07,
          ),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
      onPressed: () {
        onpressed();
      },
    );
  }

  static TextButton textButton(
      String text, TextStyle textStyle, void Function() onpressed) {
    return TextButton(
      child: Text(
        text,
        style: textStyle,
      ),
      onPressed: () {
        onpressed();
      },
    );
  }
}
