import '../Theme/app_theme.dart';
import 'package:flutter/material.dart';

class WidgetIcon {
  // WidgetIcon._();

  static Widget userAccount(bool onclick) {
    return Icon(Icons.person,
        color: onclick ? AppColors.primary : AppColors.icon);
  }
  static Widget phone(bool onclick) {
    return Icon(Icons.phone,
        color: onclick ? AppColors.primary : AppColors.icon);
  }

  static Widget email(bool onclick) {
    return Icon(Icons.email,
        color: onclick ? AppColors.primary : AppColors.icon);
  }

  static Widget passwordKey(bool onclick) {
    return Icon(Icons.vpn_key,
        color: onclick ? AppColors.primary : AppColors.icon);
  }

  static Widget description(bool onclick) {
    return Icon(Icons.description,
        color: onclick ? AppColors.primary : AppColors.icon);
  }

  static Widget alert(bool onclick) {
    return Icon(Icons.expand_circle_down_rounded,
        color: onclick ? AppColors.primary : AppColors.icon);
  }

  static Widget account(String link, double height, double width, Color col) {
    return Image.asset('assets/Icons/icon_orientation.png',
        height: height, width: width, fit: BoxFit.cover, color: col);
  }

  static Widget googleLogo(double? height, double? width, Color? col) {
    return Image.asset('assets/Icons/icon_google.png',
        height: height, width: width, fit: BoxFit.cover, color: col);
  }
}
