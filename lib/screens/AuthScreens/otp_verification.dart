import '../../Theme/app_theme.dart';
import '../../Theme/text_theme.dart';
import 'package:flutter/material.dart';
import '../../widget/widget_button.dart';
import '../../utils/navigate_screen.dart';
import 'package:mboa_pharmacie/services/localisationService/t_key.dart';
import 'package:mboa_pharmacie/screens/AuthScreens/reset_password.dart';


class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final _formKey = GlobalKey<FormState>();
  late bool alert;
  late String email, pwd, phone_num;

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
                    TKeys.otpVerification.translate(context),
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
                    TKeys.aVerificationCodeHaveBeenSendToYourEmailPleaseConfirm.translate(context),
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
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Enter Code ',
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
                        keyboardType: TextInputType.number,
                        validator: (val) =>
                            val!.isEmpty ? 'password is required' : null,
                        onChanged: (val) {
                          setState(() => pwd = val);
                        }),
                    SizedBox(height: 40),
                    WidgetButton.largeButton(TKeys.confirm.translate(context),
                        AppTextTheme.buttonwhite, AppColors.primary, null, () {
                      NavigationScreen.navigate(context, ResetPassword());
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetButton.textButton(TKeys.didNotRecieveCode.translate(context),
                            AppTextTheme.body2, () {}),
                        WidgetButton.textButton(
                            TKeys.resend.translate(context), AppTextTheme.link, () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
