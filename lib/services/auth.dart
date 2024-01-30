import 'dart:convert';
import 'callApi.dart';
import '../models/User.dart';
import 'package:flutter/material.dart';
import '../utils/navigate_screen.dart';
import 'package:http/http.dart' as http;
import '../widget/widget_alertbox.dart';
import '../bloc/UserBloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/Home/GetStarted/getStarted_screen.dart';
import '../screens/AuthScreens/sign_up/code_verification.dart';
import 'package:mboa_pharmacie/resources/local_storage_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore_for_file: use_build_context_synchronously

class AuthService {
  final _storage = const FlutterSecureStorage();

  static Future<void> localregisterUser({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    User newUser = User(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
    );

    print("this is the user $newUser");

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.add(AddUsers(users: newUser, context: context));
  }

  Future<void> localloginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    // Dispatch the LoginUser event to the UserBloc
    userBloc.add(LoginUser(email: email, password: password));

    // Listen for login status
    await for (bool status
        in userBloc.loginStatusController.stream.asBroadcastStream()) {
      if (status) {
        // Navigate to the GetStartedScreen if login is successful

        await _storage.write(key: LocalStorageKey.EMAIL, value: email);
        await _storage.write(key: LocalStorageKey.PASSWORD, value: password);

        NavigationScreen.navigate(context, GetStartedScreen());
        break; // Break out of the loop once navigation is done
      } else {
        // Show an alert box if login fails
        AlertBox.alertbox(
            context, "Registration", "Invalid Password or email", () {});
        break; // Break out of the loop once the alert box is shown
      }
    }
  }

  Future<void> register(
      BuildContext context,
      String? fName,
      String lName,
      String pNumber,
      String email,
      String password,
      String system,
      int equipment_categoriesId,
      String option,
      String role) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        // http.Request('POST', Uri.parse('http://31.187.76.34:8090/users'));
        http.Request('POST', Uri.parse('${CallApi.url}/users'));
    request.body = json.encode({
      "firstName": fName,
      "lastName": lName,
      "phoneNumber": pNumber,
      "email": email,
      "password": password,
      "system": "FRANCOPHONE",
      "equipment_categoriesId": 1,
      "optionId": 1,
      "role": "RESPONSABLE"
    });
    request.headers.addAll(headers);

    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      AlertBox.alertbox(
          context, "Registration", "Your account was successfully created", () {
        NavigationScreen.navigate(context, CodeVerification());
      });
    } else if (response.statusCode == 500) {
      AlertBox.alertbox(context, "Registration",
          "error code ${response.statusCode} : Internal Server Error", () {});
    } else if (response.statusCode == 400) {
      AlertBox.alertbox(context, "Registration",
          "error code ${response.statusCode} : Invalid credential send", () {});
    } else {
      AlertBox.alertbox(context, "Registration", "Unknown Error", () {});
    }

    // return response;
  }

  Future<void> login(
      BuildContext context, String username, String password) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    var data = {"password": password, "username": username};

    var body = json.encode(data);
    var url = Uri.parse('${CallApi.url}auth/login');
    http.Response response = await http.post(
      url,
      headers: CallApi().setHeaders(),
      body: body,
    );

    // Navigator.of(context).pop();
    print(response.body);

    if (response.statusCode == 200) {
      AlertBox.alertbox(context, "Successful", "Successfull Sign Up", () {});

      NavigationScreen.navigate(context, GetStartedScreen());

      await _storage.write(key: LocalStorageKey.EMAIL, value: username);
      await _storage.write(key: LocalStorageKey.PASSWORD, value: password);
      await _storage.write(key: "evaltech_KEY_USER_ID", value: 1.toString());
      await _storage.write(key: "evaltech_KEY_TOKEN", value: response.body);
    } else {
      AlertBox.alertbox(
          context, "Erro", "Problem with server please try later", () {});
      print(response.reasonPhrase);
    }

    // return response;
  }
}
