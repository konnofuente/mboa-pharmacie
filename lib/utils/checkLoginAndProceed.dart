import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mboa_pharmacie/provider/provider.dart';
import 'package:mboa_pharmacie/utils/navigate_screen.dart';
import 'package:mboa_pharmacie/screens/AuthScreens/sign_up/signup_screen.dart';
import 'package:mboa_pharmacie/screens/AuthScreens/sign_in/signin_screen.dart';

void checkLoginAndProceed(BuildContext context, Widget? nextScreen) {
  final isLoggedIn = Provider.of<AppStatus>(context, listen: false).isLoggedIn;

  if (!isLoggedIn) {
    // If the user is logged in, navigate to the next screen
    // NavigationScreen.navigate(context, nextScreen!);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Login Required"),
          content: Text("You must be logged in to access this service."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                // Optionally navigate to the login screen
                NavigationScreen.navigate(context, SignUp());
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(
                    context); // Close the dialog without doing anything
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
