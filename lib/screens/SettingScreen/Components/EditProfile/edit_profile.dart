import 'package:flutter/material.dart';
import '../../../../bloc/bloc_export.dart';
import '../../../../bloc/UserBloc/user_state.dart';
import 'package:mboa_pharmacie/Theme/theme_export.dart';
import 'package:mboa_pharmacie/widget/widget_export.dart';
import 'package:mboa_pharmacie/resources/export_app_manager.dart';
import 'package:mboa_pharmacie/services/localisationService/t_key.dart';
// ignore_for_file: prefer_const_constructors


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController systemController = TextEditingController();
  TextInputType textKeytype = TextInputType.text;
 
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
          title: Text(TKeys.settingTitle.translate(context)),
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
                SizedBox(height: AppSize.s10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(TKeys.changeProfilePic.translate(context)),
                ),
                SizedBox(height: AppSize.s10),
                WidgetTextForm.updateTextField(
                    TKeys.f_name.translate(context), firstNameController, textKeytype, null, null),
                SizedBox(height: AppSize.s10),
                WidgetTextForm.updateTextField(
                    TKeys.s_name.translate(context), lastNameController, textKeytype, null, null),
                SizedBox(height: AppSize.s10),
                WidgetTextForm.updateTextField(TKeys.p_num.translate(context),
                    phoneNumberController, textKeytype, null, null),
                SizedBox(height: AppSize.s10),
                SizedBox(height: AppSize.s10),
                WidgetButton.largeButton(TKeys.save.translate(context),
                    AppTextTheme.buttonwhite, AppColors.primary, null, () {
                  print(firstNameController.text);

                }),
              ],
            ),
          );
        }));
  }
}
