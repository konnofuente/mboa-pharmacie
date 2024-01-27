import '../verifie_email.dart';
import '../../../models/Role.dart';
import '../../../services/auth.dart';
import 'package:flutter/material.dart';
import '../../../Theme/app_theme.dart';
import '../sign_up/signup_screen.dart';
import 'package:provider/provider.dart';
import '../../../Theme/text_theme.dart';
import '../../../provider/provider.dart';
import '../../../widget/widget_icon.dart';
import '../../../widget/widget_button.dart';
import '../../../utils/navigate_screen.dart';
import '../../../widget/widget_alertbox.dart';
import '../../../widget/widget_textformfield.dart';
import '../../../services/internet_connection.dart';
import '../../../services/localisationService/t_key.dart';
import 'package:mboa_pharmacie/resources/style_manager.dart';
import 'package:mboa_pharmacie/resources/value_manager.dart';
import 'package:mboa_pharmacie/resources/strings_manager.dart';
import 'package:mboa_pharmacie/utils/is_loading_indicator.dart';
import 'package:mboa_pharmacie/resources/local_storage_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mboa_pharmacie/screens/AuthScreens/widget/export.dart';
import 'package:mboa_pharmacie/screens/AuthScreens/sign_in/components/email_login_form.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late bool alert;
  late String email, pwd, token;
  late TabController _tabController;
  TextEditingController emailController = TextEditingController();
  TextInputType emailKeytype = TextInputType.emailAddress;
  TextEditingController passwordController = TextEditingController();
  TextInputType phoneNumberKeytype = TextInputType.phone;
  TextEditingController phoneNumberController = TextEditingController();
  Icon icon = Icon(Icons.visibility);
  Icon hide_icon = Icon(Icons.visibility_off);
  bool isPasswordVisible = false;
  bool _isLoading = false; //bool variable created
  final _storage = const FlutterSecureStorage();

  Future<void> _readCredentialFromStorage() async {
    emailController.text = (await _storage.read(key: LocalStorageKey.EMAIL))!;
    passwordController.text =
        (await _storage.read(key: LocalStorageKey.PASSWORD))!;
    token = (await _storage.read(key: "evaltech_KEY_TOKEN"))!;
    print("$emailController  $passwordController  $token");
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _readCredentialFromStorage();
    checkconnection();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void checkconnection() async {
    await InternetConnection().CheckInternetConnectivity(context);
  }

  Future<void> loginVerification() async {
    if (_formKey.currentState!.validate()) {
      AuthService authService = AuthService();
      await authService.localloginUser(
        context: context,
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Role? role = Provider.of<AppStatus>(context).role;

    return Scaffold(
      body: !Provider.of<AppStatus>(context).isConnected
          ? isLoadingIndicator.CircularLoading(AppStrings.checkConnection)
          : SingleChildScrollView(
              child: Container(
                padding: getSymmetricPadding(AppPadding.p0, AppPadding.p40),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AuthPageTitle(
                      title: TKeys.sign_in.translate(context),
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    Column(children: [
                      Container(
                          // height: 20,
                          child: Text(
                        TKeys.welcome.translate(context),
                        style: AppTextTheme.header,
                      )),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                      AuthUserInfoWidget(role: role),
                    ]),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    Column(
                      children: [
                        TabBar(
                          controller: _tabController,
                          tabs: [
                            Tab(text: 'Email Login'),
                            Tab(text: 'Phone Login'),
                          ],
                        ),
                        Container(
                          padding: getSymmetricPadding(
                              AppPadding.p0, AppPadding.p40),
                          height: 300,
                          width: double.infinity,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              LoginForm(
                                formKey: _formKey,
                                emailController: emailController,
                                emailKeytype: emailKeytype,
                                isPasswordVisible: isPasswordVisible,
                                passwordController: passwordController,
                                phoneNumberController: phoneNumberController,
                                phoneNumberKeytype: phoneNumberKeytype,
                                isEmailFieldVisible: true,
                                 isPhoneNumberFieldVisible: false,
                              ),
                              LoginForm(
                                formKey: _formKey,
                                emailController: emailController,
                                emailKeytype: emailKeytype,
                                isPasswordVisible: isPasswordVisible,
                                passwordController: passwordController,
                                phoneNumberController: phoneNumberController,
                                phoneNumberKeytype: phoneNumberKeytype,
                                isEmailFieldVisible: false,
                                 isPhoneNumberFieldVisible: true,
                              )

                              // _buildPhoneLogin(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    WidgetButton.largeButton(
                        TKeys.sign_in.translate(context),
                        AppTextTheme.buttonwhite,
                        AppColors.primary,
                        null, () async {
                      loginVerification();
                    }),
                    Column(
                      children: [
                        WidgetButton.textButton(TKeys.f_pwd.translate(context),
                            AppTextTheme.caption, () {
                          NavigationScreen.replaceNavigate(
                              context, const ConfirmEmail());
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WidgetButton.textButton(
                                TKeys.did_not_have_acct.translate(context),
                                AppTextTheme.body2,
                                () {}),
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
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
