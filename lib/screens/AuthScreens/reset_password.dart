import '../../Theme/app_theme.dart';
import '../../Theme/text_theme.dart';
import 'package:flutter/material.dart';
import '../../widget/widget_icon.dart';
import '../../widget/widget_button.dart';
import '../../utils/navigate_screen.dart';
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
                    'Reset Password',
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
                    getTextField('New Password', passwordKeytype,
                        ' password required', WidgetIcon.passwordKey(false)),
                    SizedBox(height: 20),
                    getTextField('Repeat Password', passwordKeytype,
                        ' password dont match', WidgetIcon.passwordKey(false)),
                    SizedBox(height: 20),
                    SizedBox(height: 40),
                    WidgetButton.largeButton('Reset', AppTextTheme.buttonwhite,
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

  Future<void> showalertDialogue() async {
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("LOGIN ERROR"),
      content: Text("Credential Enter are Invalid "),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
