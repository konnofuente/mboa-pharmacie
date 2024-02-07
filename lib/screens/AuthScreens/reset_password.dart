import '../../Theme/app_theme.dart';
import '../../Theme/text_theme.dart';
import 'package:flutter/material.dart';
import '../../widget/widget_icon.dart';
import '../../widget/widget_button.dart';
import '../../utils/navigate_screen.dart';
import 'package:mboa_pharmacie/services/localisationService/t_key.dart';
import 'package:mboa_pharmacie/screens/AuthScreens/sign_in/signin_screen.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  late bool alert;
  late String email;
  TextInputType passwordKeytype = TextInputType.visiblePassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    TKeys.resetPassword.translate(context),
                    style: AppTextTheme.bigtitle,
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                    "You will have to inout another password for your new password Mr @gmail.com ",
                    style: AppTextTheme.caption,
                  )),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    getTextField(TKeys.newPassword.translate(context), passwordKeytype,
                        TKeys.passwordRequired.translate(context), WidgetIcon.passwordKey(false)),
                    SizedBox(height: 20),
                    getTextField(TKeys.repeatPassword.translate(context), passwordKeytype,
                        TKeys.passwordNotMatch.translate(context), WidgetIcon.passwordKey(false)),
                    SizedBox(height: 20),
                    SizedBox(height: 40),
                    WidgetButton.largeButton(TKeys.reset.translate(context), AppTextTheme.buttonwhite,
                        AppColors.primary, null, () {
                      NavigationScreen.navigate(context, SignIn());
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField getTextField(
      String text, TextInputType keytype, String errorText, Widget icon) {
    return TextFormField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0),
          prefixIcon: icon,
          labelText: text,
          // hintText: hinttext.isEmpty ? hinttext : ' ',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(color: Colors.blue)),
        ),
        keyboardType: keytype,
        obscureText: keytype == TextInputType.visiblePassword ? true : false,
        // obscureText: true,
        validator: (val) => val!.isEmpty ? errorText : null,
        onChanged: (val) {
          // setState(() => uname = val);
        });
  }

}
