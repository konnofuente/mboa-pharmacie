import 'otp_verification.dart';
import '../../Theme/app_theme.dart';
import '../../Theme/text_theme.dart';
import 'package:flutter/material.dart';
import '../../widget/widget_icon.dart';
import '../../widget/widget_button.dart';
import '../../utils/navigate_screen.dart';
import '../../widget/widget_textformfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mboa_pharmacie/services/localisationService/t_key.dart';


class ConfirmEmail extends StatefulWidget {
  ConfirmEmail({Key? key}) : super(key: key);

  @override
  _ConfirmEmailState createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextInputType emailKeytype = TextInputType.emailAddress;
  late bool alert;
  late String email;
  late bool email_input = true;
  late bool phone_input = false;
  late String phno;

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
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  email_input
                      ? Text(
                          TKeys.enterEmail.translate(context),
                          style: AppTextTheme.bigtitle,
                        )
                      : Text(
                          TKeys.enterPhoneNumber.translate(context),
                          style: AppTextTheme.bigtitle,
                        )
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30.0,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Flexible(
                      child: Text(
                    "Give your email so that evaltech can send you a verification code ",
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
                    email_input
                        ? WidgetTextForm.getTextField(
                            TKeys.email.translate(context),
                            emailController,
                            emailKeytype,
                            TKeys.enterEmail.translate(context),
                            WidgetIcon.email(false))
                        : IntlPhoneField(
                            decoration: InputDecoration(
                              labelText: TKeys.phoneNumber.translate(context),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            initialCountryCode: 'CM',
                            onChanged: (phone) {
                              setState(() => phno = phone.completeNumber);
                            },
                          ),

               

                    SizedBox(height: 40),
                    WidgetButton.largeButton(TKeys.confirm.translate(context),
                        AppTextTheme.buttonwhite, AppColors.primary, null, () {
                      NavigationScreen.navigate(
                          context, OTPVerification());
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetButton.textButton(
                            TKeys.useAnotherMethod.translate(context), AppTextTheme.body2, () {}),
                        WidgetButton.textButton(
                            TKeys.phoneNumber.translate(context), AppTextTheme.link, () {
                          setState(() {
                            email_input = false;
                            phone_input = !phone_input;
                          });
                        }),
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
