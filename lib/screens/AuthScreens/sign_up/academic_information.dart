// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:mboa_pharmacie/models/Role.dart';
import 'package:mboa_pharmacie/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../Theme/app_theme.dart';
import '../../../Theme/text_theme.dart';
import '../../../models/User.dart';
import '../../../services/auth.dart';
import '../../../size_config.dart';
import '../../../utils/navigate_screen.dart';
import '../../../widget/widget_alertbox.dart';
import '../../../widget/widget_button.dart';
import '../../../widget/widget_icon.dart';
import '../../../widget/widget_textformfield.dart';
import '../sign_in/signin_screen.dart';
import 'code_verification.dart';

class AcademicInformation extends StatefulWidget {
  const AcademicInformation({Key? key}) : super(key: key);

  @override
  _AcademicInformationState createState() => _AcademicInformationState();
}

class _AcademicInformationState extends State<AcademicInformation> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String message = "check your connection";
  late List<String> seriesList;
  late List<String> systemList;
  late List<String> equipment_categoriesList;
  late List<String> optionList;
  late String serie;
  late String system;
  late String equipment_categories;
  late String option;
  late int equipment_categoriesId;
  bool serieFocus = false;

  @override
  void initState() {
    seriesList = ["A", "Adfdl", "Aldfdfdlll", "Aldfdfdfllll"];
    systemList = [
      "FRANCOPHONE",
      "ANGLOPHONE",
    ];
    equipment_categoriesList = [
      "Select Your EquipmentCategories",
      "Form 1",
      "Form 2",
      "Form 3",
      "Upper Sixth"
    ];
    optionList = [
      "Select Your Option",
      "A",
      "B",
      "C",
    ];
    serie = "A";
    system = systemList[0];
    equipment_categories = equipment_categoriesList[0];
    option = optionList[0];
    equipment_categoriesId = 2;
  }

  @override
  Widget build(BuildContext context) {
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
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 50,
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Text(
                      'Accademic \n Information',
                      style: AppTextTheme.bigtitle,
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 8, bottom: 8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.all(
                            color: serieFocus ? Colors.blue : Colors.grey,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          // decoration: InputDecoration(labelText:'Select City'),
                          hint: Text("System"),
                          value: system,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.blue,
                          ),
                          elevation: 16,
                          isExpanded: true,
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onTap: () {},
                          onChanged: (String? newValue) {
                            setState(() {
                              if (newValue!.isEmpty) {
                                // addError(error: kEmptySerie);
                              } else {
                                system = newValue;
                                print(system);
                              }
                            });
                          },
                          items: systemList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 8, bottom: 8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.all(
                            color: serieFocus ? Colors.blue : Colors.grey,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          hint: Text("Select Your EquipmentCategories"),
                          value: equipment_categories,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.blue,
                          ),
                          elevation: 16,
                          isExpanded: true,
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              // nameFocus = false;
                              // sysEduFocus = false;
                              // classeFocus = false;
                              // serieFocus = true;
                            });
                          },
                          onChanged: (String? newValue) {
                            setState(() {
                              if (newValue!.isEmpty) {
                                // addError(error: kEmptySerie);
                              } else {
                                equipment_categories = newValue;
                              }
                            });
                          },
                          items: equipment_categoriesList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 8, bottom: 8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.all(
                            color: serieFocus ? Colors.blue : Colors.grey,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          hint: Text("Select Your Option"),
                          value: option,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.blue,
                          ),
                          elevation: 16,
                          isExpanded: true,
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              // nameFocus = false;
                              // sysEduFocus = false;
                              // classeFocus = false;
                              // serieFocus = true;
                            });
                          },
                          onChanged: (String? newValue) {
                            setState(() {
                              if (newValue!.isEmpty) {
                                // addError(error: kEmptySerie);
                              } else {
                                option = newValue;
                              }
                            });
                          },
                          items: optionList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      WidgetButton.largeButton(
                          'Register',
                          AppTextTheme.buttonwhite,
                          AppColors.primaryblue,
                          null, () async {
                        if (_formKey.currentState!.validate()) {
                          User halfUser =
                              Provider.of<UserCreation>(context, listen: false)
                                  .userCreation!;

                          AuthService().register(
                              context,
                              halfUser.firstName!,
                              halfUser.lastName!,
                              halfUser.phoneNumber!,
                              halfUser.email!,
                              halfUser.password!,
                              system,
                              1,
                              option,
                              "STUDENT");
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
                    'Already have an account, SignIn', AppTextTheme.link, () {
                  NavigationScreen.replaceNavigate(context, SignIn());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
