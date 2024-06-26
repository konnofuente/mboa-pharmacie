import '../models/User.dart';
import 'package:share/share.dart';
import '../bloc/bloc_export.dart';
import '../provider/provider.dart';
import '../Theme/theme_export.dart';
import '../utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mboa_pharmacie/models/enum.dart';
import '../services/localisationService/t_key.dart';
import '../screens/AuthScreens/sign_in/signin_screen.dart';
// ignore_for_file: prefer_const_declarations

// ignore_for_file: prefer_const_constructors

// ignore_for_file: public_member_api_docs, sort_constructors_first


class AppDrawer extends StatefulWidget {
  late Function onTapCallBackFunction;
  AppDrawer({
    Key? key,
    required this.onTapCallBackFunction,
  }) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override

  @override
  void initState() {
    _getUserInformation();
    super.initState();
  }

  late User userInformation = User();

  void _getUserInformation() {
    userInformation = BlocProvider.of<UserBloc>(context).state.appUser!;

  }


  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: const EdgeInsets.all(0.0), children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(
            userInformation.firstName!,
            style: AppTextTheme.body1,
          ),
          accountEmail:  Text(
            userInformation.email!,
            style: AppTextTheme.body2,
          ),
          currentAccountPicture: CircleAvatar(
            // backgroundColor: AppColors.black,
            backgroundImage: AssetImage('assets/Images/avatar.png'),
          ),
          otherAccountsPictures: const <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white60,
              child: Text('A'),
            ),
            CircleAvatar(
              child: Text('R'),
            ),
          ],
          onDetailsPressed: () {},
          decoration: BoxDecoration(
            color: AppColors.white,
            // image: DecorationImage(
            //     image: AssetImage('assets/Icons/icon_group.png'),
            //     fit: BoxFit.cover)
          ),
        ),
        ListTile(
          title: Text(TKeys.home.translate(context)),
          leading: const Icon(Icons.person),
          onTap: () {
            widget.onTapCallBackFunction(AppDrawerTitle.Home);
            Navigator.of(context).pop();
          },
          onLongPress: () {},
        ),
        const Divider(),

        ListTile(
            title: Text('Share App'),
            leading: const Icon(Icons.share),
            onLongPress: () {},
            onTap: () {
              // Share app functionality
              final String playStoreLink =
                  'https://play.google.com/store/apps/details?id=com.africappsdigital.evaltech';
              Share.share('Check out this app: $playStoreLink');
              Navigator.of(context).pop();
            }),
        ListTile(
          title: Text("Contact Us"),
          leading: const Icon(Icons.contact_phone),
          onTap: () {
            // Contact Us functionality (WhatsApp contact)
            final String whatsappNumber =
                '+237694766972'; // Replace with your WhatsApp number
            final String whatsappUrl = 'https://wa.me/$whatsappNumber';
            launch(whatsappUrl);
            Navigator.of(context).pop();
          },
        ),
        const Divider(),
        ListTile(
          title: Text(TKeys.setting.translate(context)),
          leading: const Icon(Icons.settings),
          onTap: () {
            widget.onTapCallBackFunction(AppDrawerTitle.Setting);
            Navigator.of(context).pop();
          },
          onLongPress: () {},
        ),
        const Divider(),
        ListTile(
            title: Text(TKeys.logout.translate(context)),
            leading: const Icon(Icons.close),
            onTap: () {
              Provider.of<AppStatus>(context, listen: false).isLoggedIn = false;
              NavigationScreen.replaceNavigate(context, SignIn());
            }),
      ]),
    );
  }
}
