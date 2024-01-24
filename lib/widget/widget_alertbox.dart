import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../Theme/app_theme.dart';

class AlertBox {
  static Future<String?> alertbox(BuildContext context, String title,
      String message, void Function() onpressedOK) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onpressedOK();
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static AwesomeDialog awesomeAlertBox(BuildContext context, String title,
      String message, void Function() onpressedOK) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      borderSide: const BorderSide(
        color: Colors.white,
        width: 2,
      ),
      width: 400,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      onDismissCallback: (type) {},
      headerAnimationLoop: true,
      animType: AnimType.bottomSlide,
      title: title,
      desc: message,
      showCloseIcon: true,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        onpressedOK();
      },
    )..show();
  }

  static AwesomeDialog awesomeOkBox(BuildContext context, String title,
      String message, void Function() onpressedOK) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      borderSide: const BorderSide(
        color: Colors.white,
        width: 2,
      ),
      width: 400,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      onDismissCallback: (type) {},
      headerAnimationLoop: true,
      animType: AnimType.bottomSlide,
      title: title,
      desc: message,
      showCloseIcon: true,
      btnOkColor: AppColors.primaryblue,
      btnOkOnPress: () {
        onpressedOK();
      },
    )..show();
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.download),
                  title: Text('Download'),
                  onTap: () {
                    // implement download functionality
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.open_in_browser),
                  title: Text('Open'),
                  onTap: () {
                    // implement open functionality
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.more_horiz),
                  title: Text('Other'),
                  onTap: () {
                    // implement other functionality
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
