import 'package:mboa_pharmacie/Theme/text_theme.dart';
import 'package:mboa_pharmacie/Theme/theme_export.dart';
import 'package:mboa_pharmacie/services/userServices.dart';
import 'package:mboa_pharmacie/widget/widget_export.dart';
import 'package:flutter/material.dart';

import '../../../../bloc/UserBloc/user_state.dart';
import '../../../../bloc/bloc_export.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String val = "dfdf";
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController systemController = TextEditingController();
  TextInputType textKeytype = TextInputType.text;
  String name = "John Doe";
  String email = "johndoe@example.com";
  String phone = "123-456-7890";
  String password = "*********";
  String imageUrl =
      "https://images.unsplash.com/photo-1521747116042-5a810fda9663?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGdyb3VwJTIwcGhvdG9ncmFwaHklMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80";

  Future<void> _displayUserInfo() async {
    final userstate = context.read<UserBloc>().state;
    emailController = TextEditingController(text: userstate.appUser!.email);
    firstNameController =
        TextEditingController(text: userstate.appUser!.firstName);
    lastNameController =
        TextEditingController(text: userstate.appUser!.lastName);
    phoneNumberController =
        TextEditingController(text: userstate.appUser!.phoneNumber);
  }

  void initState() {
    _displayUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("assets/Images/avatar.png"),
                  radius: 60.0,
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Change profile picture"),
                ),
                SizedBox(height: 10.0),
                WidgetTextForm.updateTextField(
                    "First Name", firstNameController, textKeytype, null, null),
                SizedBox(height: 10.0),
                WidgetTextForm.updateTextField(
                    "Last Name", lastNameController, textKeytype, null, null),
                SizedBox(height: 10.0),
                WidgetTextForm.updateTextField("Phone Number",
                    phoneNumberController, textKeytype, null, null),
                SizedBox(height: 10.0),
                SizedBox(height: 10.0),
                WidgetButton.largeButton("Save Changes",
                    AppTextTheme.buttonwhite, AppColors.primaryblue, null, () {
                  print(firstNameController.text);
                  // UserService().UpdateOnline(
                  //     context,
                  //     firstNameController.text,
                  //     lastNameController.text,
                  //     phoneNumberController.text,
                  //     state.appUser!.system,
                  //     state.appUser!.equipment_categoriesId,
                  //     1,
                  //     state.appUser!.role);

                  // print(state.appUser!.option);
                }),
              ],
            ),
          );
        }));
  }
}
