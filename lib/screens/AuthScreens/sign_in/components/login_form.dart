import 'package:flutter/material.dart';
import '../../../../widget/widget_export.dart';
import 'package:mboa_pharmacie/resources/export_app_manager.dart';
import 'package:mboa_pharmacie/services/localisationService/t_key.dart';
// ignore_for_file: must_be_immutable


class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextInputType emailKeytype;
  final TextEditingController phoneNumberController;
  final TextInputType phoneNumberKeytype;
  final TextEditingController passwordController;

  late  bool isPasswordVisible;
  final bool isEmailFieldVisible;
  final bool isPhoneNumberFieldVisible;

  LoginForm({
    required this.formKey,
    required this.emailController,
    required this.emailKeytype,
    required this.phoneNumberController,
    required this.phoneNumberKeytype,
    required this.isPasswordVisible,
    required this.isEmailFieldVisible,
    required this.passwordController, required this.isPhoneNumberFieldVisible,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String pwd = "";
  Icon icon = Icon(Icons.visibility);
  Icon hide_icon = Icon(Icons.visibility_off);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const SizedBox(height: AppSize.s18),
          Visibility(
            visible: widget.isEmailFieldVisible,
            child: Column(
              children: [
                const SizedBox(height: AppSize.s18),
                WidgetTextForm.getTextField(
                  TKeys.email.translate(context),
                  widget.emailController,
                  widget.emailKeytype,
                  TKeys.email.translate(context),
                  WidgetIcon.userAccount(false),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.isPhoneNumberFieldVisible,
            child: Column(
              children: [
                const SizedBox(height: AppSize.s18),
                WidgetTextForm.getTextField(
                  TKeys.p_num.translate(context),
                  widget.phoneNumberController,
                  widget.phoneNumberKeytype,
                  TKeys.p_num.translate(context),
                  WidgetIcon.phone(false),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s18),
          TextFormField(
            controller: widget.passwordController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.vpn_key, color: Colors.blue),
              labelText: TKeys.pwd.translate(context),
              hintText: "",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    widget.isPasswordVisible = !widget.isPasswordVisible;
                    print(!widget.isPasswordVisible);
                  });
                },
                icon: widget.isPasswordVisible ? icon : hide_icon,
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            keyboardType: TextInputType.text,
            obscureText: widget.isPasswordVisible,
            validator: (val) =>
                val!.isEmpty ? TKeys.pwd.translate(context) : null,
            onChanged: (val) {
              setState(() => pwd = val);
            },
          ),
        ],
      ),
    );
  }
}
