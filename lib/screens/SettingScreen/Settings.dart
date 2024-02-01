import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mboa_pharmacie/models/User.dart';
import 'Components/EditProfile/edit_profile.dart';
import 'package:mboa_pharmacie/bloc/bloc_export.dart';
import 'package:mboa_pharmacie/utils/navigate_screen.dart';
import 'package:mboa_pharmacie/resources/export_app_manager.dart';
import 'package:mboa_pharmacie/services/localisationService/t_key.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    _getUserInformation();
    super.initState();
  }

  late User userInformation = User();

  void _getUserInformation() {
    userInformation = BlocProvider.of<UserBloc>(context).state.appUser!;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // user card
              SimpleUserCard(
                // userName:  TKeys.userName.translate(context),
                userName:  userInformation.lastName ?? TKeys.userName.translate(context) ,
                userProfilePic: AssetImage(ImageAssets.profile),
              ),
              SettingsGroup(
                settingsGroupTitle: TKeys.accountTitle.translate(context),
                items: [
                  SettingsItem(
                    onTap: () {
                      NavigationScreen.navigate(context, EditProfile());
                    },
                    icons: CupertinoIcons.pencil_outline,
                    iconStyle: IconStyle(),
                    title: TKeys.editProfileTitle.translate(context),
                    subtitle:userInformation.lastName ?? TKeys.editProfileSubtitle.translate(context),
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.fingerprint,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: TKeys.privacyTitle.translate(context),
                    subtitle: TKeys.privacySubtitle.translate(context),
                  ),
                  // SettingsItem(
                  //   onTap: () {},
                  //   icons: Icons.dark_mode_rounded,
                  //   iconStyle: IconStyle(
                  //     iconsColor: Colors.white,
                  //     withBackground: true,
                  //     backgroundColor: Colors.red,
                  //   ),
                  //   title: TKeys.darkModeTitle.translate(context),
                  //   subtitle: TKeys.darkModeSubtitle.translate(context),
                  //   trailing: Switch.adaptive(
                  //     value: false,
                  //     onChanged: (value) {},
                  //   ),
                  // ),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.info_rounded,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                    ),
                    title: TKeys.aboutTitle.translate(context),
                    subtitle: TKeys.aboutSubtitle.translate(context),
                  ),
                ],
              ),
              // You can add a settings title
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.exit_to_app_rounded,
                    title: TKeys.signOutTitle.translate(context),
                  ),
                  // SettingsItem(
                  //   onTap: () {},
                  //   icons: CupertinoIcons.repeat,
                  //   title: TKeys.changeEmailTitle.translate(context),
                  // ),
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.delete_solid,
                    title: TKeys.deleteAccountTitle.translate(context),
                    titleStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
