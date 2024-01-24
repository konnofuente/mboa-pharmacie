import 'package:flutter/material.dart';

class Custom_Button {

  Padding getBigButton(
      BuildContext? context, Color? color, void Function() onpressed, String title,TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            onpressed();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: style,
          ),
        ),
      ),
    );
  }
}
