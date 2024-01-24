import 'package:mboa_pharmacie/screens/Home/GetStarted/getStarted_screen.dart';
import 'package:flutter/material.dart';

import '../../../Theme/app_theme.dart';
import '../../../Theme/text_theme.dart';
import '../../../utils/navigate_screen.dart';
import '../../../widget/widget_button.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({Key? key}) : super(key: key);

  @override
  _CodeVerificationState createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  final _formKey = GlobalKey<FormState>();
  late bool alert;
  late String email, pwd, phone_num;

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
                  const Text(
                    'Code Verification',
                    style: AppTextTheme.bigtitle,
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Flexible(
                      child: Text(
                    "a verification code have been send to your email please confirm",
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
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Enter Code ',
                          hintText: "",
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
                            val!.isEmpty ? 'code is required' : null,
                        onChanged: (val) {
                          setState(() => pwd = val);
                        }),
                    const SizedBox(height: 40),
                    WidgetButton.largeButton(
                        'Confirm',
                        AppTextTheme.buttonwhite,
                        AppColors.primaryblue,
                        null, () {
                      if (_formKey.currentState!.validate()) {
                        NavigationScreen.replaceNavigate(
                            context, GetStartedScreen());
                      }
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetButton.textButton('Did not recieve code ?',
                            AppTextTheme.body2, () {}),
                        WidgetButton.textButton(
                            'resend', AppTextTheme.link, () {}),
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
