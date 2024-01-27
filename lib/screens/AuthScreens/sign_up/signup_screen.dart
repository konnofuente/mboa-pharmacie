import 'code_verification.dart';
import '../../../services/auth.dart';
import 'package:flutter/material.dart';
import '../../../Theme/app_theme.dart';
import '../sign_in/signin_screen.dart';
import '../../../Theme/text_theme.dart';
import '../../../widget/widget_icon.dart';
import '../../../widget/widget_button.dart';
import '../../../utils/navigate_screen.dart';
import 'package:mboa_pharmacie/models/Role.dart';
import '../../../widget/widget_textformfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../services/localisationService/t_key.dart';
import 'package:mboa_pharmacie/resources/value_manager.dart';
import 'package:mboa_pharmacie/screens/AuthScreens/widget/export.dart';
// ignore_for_file: prefer_const_constructors


// ignore_for_file: use_build_context_synchronously

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  late String uname, email, pwd, phno;
  String message = "check your connection";
  TextInputType emailKeytype = TextInputType.emailAddress;
  TextInputType passwordKeytype = TextInputType.visiblePassword;
  TextInputType textKeytype = TextInputType.text;
  late List<String> seriesList;
  late String serie;
  bool serieFocus = false;




  @override
  Widget build(BuildContext context) {
    void submitForm() {
      if (_formKey.currentState!.validate()) {
        NavigationScreen.navigate(
            context, CodeVerification());
            
        AuthService.localregisterUser(
          context: context,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phoneNumber: phno,
          email: emailController.text,
          password: passwordController.text,
        );
      }
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSize.s40),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.s50,
                ),
                AuthPageTitle(title: TKeys.creat_acct.translate(context)),
                SizedBox(
                  height: AppSize.s20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      WidgetTextForm.getTextField(
                          TKeys.f_name.translate(context),
                          firstNameController,
                          textKeytype,
                          ' ${TKeys.enter.translate(context)} ${TKeys.f_name.translate(context)}',
                          WidgetIcon.userAccount(false)),
                      SizedBox(height: AppSize.s20),
                      WidgetTextForm.getTextField(
                          TKeys.s_name.translate(context),
                          lastNameController,
                          textKeytype,
                          ' ${TKeys.enter.translate(context)} ${TKeys.s_name.translate(context)}',
                          WidgetIcon.userAccount(false)),
                      SizedBox(height: AppSize.s20),
                      IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: TKeys.p_num.translate(context),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'CM',
                        onChanged: (phone) {
                          setState(() => phno = phone.completeNumber);
                        },
                      ),
                      SizedBox(height: 10),
                      WidgetTextForm.getTextField(
                          TKeys.email.translate(context),
                          emailController,
                          emailKeytype,
                          ' ${TKeys.enter.translate(context)} ${TKeys.email.translate(context)}',
                          WidgetIcon.email(false)),
                      SizedBox(height: AppSize.s20),
                      WidgetTextForm.getTextField(
                          TKeys.pwd.translate(context),
                          passwordController,
                          passwordKeytype,
                          ' ${TKeys.enter.translate(context)} ${TKeys.pwd.translate(context)}',
                          WidgetIcon.passwordKey(false)),
                      SizedBox(height: AppSize.s20),
                      WidgetButton.largeButton(
                          TKeys.next.translate(context),
                          AppTextTheme.buttonwhite,
                          AppColors.primary,
                          null, () {
                        submitForm();
                      }),
                      SizedBox(
                        height: AppSize.s20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.s20),
                WidgetButton.textButton(
                    TKeys.already_h_acct.translate(context),
                    AppTextTheme.link, () {
                  NavigationScreen.replaceNavigate(context, SignIn());
                }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
