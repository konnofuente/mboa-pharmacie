import 'package:flutter/material.dart';

import '../Theme/app_theme.dart';
import '../Theme/text_theme.dart';


AppBar buildAppBar(String title, bool backButton, Icon? leftIcon, VoidCallback? onPressed) {
  return AppBar(
    backgroundColor: AppColors.primaryblue,
    centerTitle: true,
    automaticallyImplyLeading: backButton,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColors.white),
    title: Text(
      title,
      style: AppTextTheme.appbartitle,
    ),
   leading: leftIcon != null ? IconButton(
      icon: leftIcon,
      onPressed: onPressed,
    ) : null,
  );
}
