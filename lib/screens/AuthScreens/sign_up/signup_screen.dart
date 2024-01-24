// ignore_for_file: use_build_context_synchronously
import 'package:mboa_pharmacie/models/Role.dart';
import 'package:mboa_pharmacie/screens/AuthScreens/sign_up/academic_information.dart';
import 'package:mboa_pharmacie/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../../../Theme/app_theme.dart';
import '../../../Theme/text_theme.dart';
import '../../../bloc/UserBloc/User_state.dart';
import '../../../bloc/UserBloc/user_state.dart';
import '../../../bloc/bloc_export.dart';
import '../../../models/User.dart';
import '../../../services/auth.dart';
import '../../../services/localisationService/t_key.dart';
import '../../../utils/navigate_screen.dart';
import '../../../widget/widget_button.dart';
import '../../../widget/widget_icon.dart';
import '../../../widget/widget_textformfield.dart';
import 'code_verification.dart';
import '../sign_in/signin_screen.dart';

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

  ElevatedButton getbutton(GlobalKey<FormState> formKey, String text,
      TextStyle textStyle, Color backgroundColor, Widget? logo) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onSurface: AppColors.primaryblue,
          primary: backgroundColor,
          fixedSize: const Size(350, 50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo == null ? Container() : logo,
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
      onPressed: () async {
        if (formKey.currentState!.validate()) {}
        // alertDia ? '' : showalertDialogue();
        // function;
      },
    );
  }

  @override
  void initState() {
    Role role = Role.RESPONSABLE;
  }

  @override
  Widget build(BuildContext context) {
    void navigate() {
      if (_formKey.currentState!.validate()) {
        NavigationScreen.navigate(context, CodeVerification());
      }
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    TKeys.creat_acct.translate(context),
                    style: AppTextTheme.bigtitle,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    WidgetTextForm.getTextField(
                        TKeys.f_name.translate(context),
                        firstNameController,
                        textKeytype,
                        ' Enter ${TKeys.f_name.translate(context)}',
                        WidgetIcon.userAccount(false)),
                    SizedBox(height: 20),
                    WidgetTextForm.getTextField(
                        TKeys.s_name.translate(context),
                        lastNameController,
                        textKeytype,
                        ' Enter ${TKeys.s_name.translate(context)}',
                        WidgetIcon.userAccount(false)),
                    SizedBox(height: 20),
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
                        ' Enter ${TKeys.email.translate(context)}',
                        WidgetIcon.email(false)),
                    SizedBox(height: 20),
                    WidgetTextForm.getTextField(
                        TKeys.pwd.translate(context),
                        passwordController,
                        passwordKeytype,
                        ' Enter ${TKeys.pwd.translate(context)}',
                        WidgetIcon.passwordKey(false)),
                    SizedBox(height: 20),
                    WidgetButton.largeButton('Next', AppTextTheme.buttonwhite,
                        AppColors.primaryblue, null, () {
                      if (_formKey.currentState!.validate()) {
                        AuthService.localregisterUser(
                          context: context,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          phoneNumber: phno,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        // NavigationScreen.navigate(
                        //     context, CodeVerification());
                      }
                    }),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              WidgetButton.textButton(
                  TKeys.already_h_acct.translate(context), AppTextTheme.link,
                  () {
                NavigationScreen.replaceNavigate(context, SignIn());
              }),
            ],
          ),
        ),
      ),
    ));
  }
}
