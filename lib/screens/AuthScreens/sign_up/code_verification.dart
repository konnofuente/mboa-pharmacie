import 'package:flutter/material.dart';
import '../../../Theme/app_theme.dart';
import '../../../Theme/text_theme.dart';
import '../../../widget/widget_button.dart';
import '../../../utils/navigate_screen.dart';
import 'package:mboa_pharmacie/resources/value_manager.dart';
import 'package:mboa_pharmacie/screens/AuthScreens/widget/export.dart';
import 'package:mboa_pharmacie/services/localisationService/t_key.dart';
import 'package:mboa_pharmacie/screens/Home/GetStarted/getStarted_screen.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s40),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             AuthPageTitle(title: TKeys.code_verif.translate(context)),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Flexible(
                      child: Text(
                    TKeys.code_verif_subtitle.translate(context),
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
                            val!.isEmpty ? TKeys.req_code.translate(context) : null,
                        onChanged: (val) {
                          setState(() => pwd = val);
                        }),
                    const SizedBox(height: 40),
                    WidgetButton.largeButton(TKeys.confirm.translate(context),
                        AppTextTheme.buttonwhite, AppColors.primary, null, () {
                      if (_formKey.currentState!.validate()) {
                        NavigationScreen.replaceNavigate(
                            context, GetStartedScreen());
                      }
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetButton.textButton(TKeys.not_recieve_code.translate(context),
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

}
