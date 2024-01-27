import 'package:flutter/material.dart';
import '../../../Theme/theme_export.dart';
import 'package:mboa_pharmacie/models/Role.dart';
import 'package:mboa_pharmacie/widget/widget_icon.dart';
import 'package:mboa_pharmacie/services/localisationService/t_key.dart';


class AuthUserInfoWidget extends StatelessWidget {
  final Role? role;

  const AuthUserInfoWidget({required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 20,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetIcon.alert(true),
          Align(
            alignment: Alignment.center,
            child: Text(
              " ${TKeys.auth_user_info.translate(context)} : ${role == Role.ADMIN ? Role.ADMIN.name : Role.RESPONSABLE.name}",
              style: AppTextTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
