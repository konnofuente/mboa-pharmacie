import 'otp_verification.dart';
import '../../Theme/app_theme.dart';
import '../../Theme/text_theme.dart';
import 'package:flutter/material.dart';
import '../../widget/widget_icon.dart';
import '../../widget/widget_button.dart';
import '../../utils/navigate_screen.dart';
import '../../widget/widget_textformfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ConfirmEmail extends StatefulWidget {
  const ConfirmEmail({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
                      ? const Text(
                          'Enter Email',
                          style: AppTextTheme.bigtitle,
                        )
                      : const Text(
                          'Enter Phone Number',
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
                      child: const Text(
                    "Give your email so that evaltech can send you a verification code ",
                    style: AppTextTheme.caption,
                  )),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    email_input
                        ? WidgetTextForm.getTextField(
                            'Email',
                            emailController,
                            emailKeytype,
                            ' Enter Email',
                            WidgetIcon.email(false))
                        : IntlPhoneField(
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            initialCountryCode: 'CM',
                            onChanged: (phone) {
                              setState(() => phno = phone.completeNumber);
                            },
                          ),

                    // TextFormField(
                    //     decoration: const InputDecoration(
                    //       labelText: 'Enter Mail ',
                    //       hintText: "",
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.all(
                    //             Radius.circular(10.0),
                    //           ),
                    //           borderSide: BorderSide(color: Colors.grey)),
                    //       focusedBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.all(
                    //             Radius.circular(10.0),
                    //           ),
                    //           borderSide: BorderSide(color: Colors.blue)),
                    //     ),
                    //     keyboardType: TextInputType.emailAddress,
                    //     validator: (val) =>
                    //         val!.isEmpty ? 'mail is required' : null,
                    //     onChanged: (val) {
                    //     }),

                    const SizedBox(height: 40),
                    WidgetButton.largeButton('Confirm',
                        AppTextTheme.buttonwhite, AppColors.primary, null, () {
                      NavigationScreen.navigate(
                          context, const OTPVerification());
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetButton.textButton(
                            'Use Another method ?', AppTextTheme.body2, () {}),
                        WidgetButton.textButton(
                            'Phone Number', AppTextTheme.link, () {
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

  Future<void> showalertDialogue() async {
    Widget okButton = ElevatedButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("LOGIN ERROR"),
      content: const Text("Credential Enter are Invalid "),
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
