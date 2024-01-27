import 'package:flutter/material.dart';
import 'package:mboa_pharmacie/Theme/text_theme.dart';

class AuthPageTitle extends StatelessWidget {
  final String title;

  const AuthPageTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextTheme.bigtitle,
        ),
      ),
    );
  }
}

