import 'package:flutter/material.dart';
import '../../../../Theme/theme_export.dart';
import '../../../../utils/utils_export.dart';
import '../../../../widget/widget_export.dart';
import 'package:mboa_pharmacie/models/Role.dart';
import 'package:mboa_pharmacie/resources/value_manager.dart';
import 'package:mboa_pharmacie/screens/AuthScreens/verifie_email.dart';
import 'package:mboa_pharmacie/services/localisationService/t_key.dart';
import 'package:mboa_pharmacie/screens/AuthScreens/sign_up/signup_screen.dart';



class SignInFooter extends StatelessWidget {
  const SignInFooter({
    Key? key,
    required this.role,
  }) : super(key: key);

  final Role? role;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetButton.textButton(TKeys.f_pwd.translate(context),
            AppTextTheme.caption, () {
          NavigationScreen.replaceNavigate(
              context, ConfirmEmail());
        }),
        const SizedBox(
          height: AppSize.s20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetButton.textButton(
                TKeys.did_not_have_acct.translate(context),
                AppTextTheme.body2,
                () {
                    NavigationScreen.replaceNavigate(
              context, const SignUp());
                }),
            role == Role.ADMIN
                ? WidgetButton.textButton(
                    TKeys.sign_up.translate(context),
                    AppTextTheme.link, () {
                    NavigationScreen.navigate(
                        context, const SignUp());
                  })
                : WidgetButton.textButton(
                    TKeys.request_acct.translate(context),
                    AppTextTheme.link, () {
                    AlertBox.awesomeOkBox(
                        context,
                        "Requette de Compte ",
                        "Contacter l'administrateur pour la creation de votre compte",
                        () {});
                  }),
          ],
        ),
      ],
    );
  }
}
