import 'package:mboa_pharmacie/bloc/bloc_export.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../widget/widget_alertbox.dart';

class UserService {
  Future<void> UpdateOnline(
      BuildContext context,
      String? fName,
      String lName,
      String pNumber,
      String? system,
      int? equipment_categoriesId,
      int? option,
      String? role) async {
    var headers = {'Content-Type': 'application/json'};

    var request =
        http.Request('PATCH', Uri.parse('http://31.187.76.34:8090/users/1'));
    var body = json.encode({
      "firstName": fName,
      "lastName": lName,
      "phoneNumber": pNumber,
      "system": system,
      "equipment_categoriesId": equipment_categoriesId,
      "optionId": option,
      "role": role
    });
    request.headers.addAll(headers);
    request.body = body;

    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.body);
    if (response.statusCode == 200) {
      context.read<UserBloc>().add(FetchUsersInfo());
      AlertBox.alertbox(
          context, "Update User", "Sucessfull update of user information", () {
        Navigator.pop(context);
      });
    } else if (response.statusCode == 404) {
      AlertBox.alertbox(context, "Update User",
          "error code ${response.statusCode} : Internal Server Error", () {});
    } else if (response.statusCode == 400) {
      AlertBox.alertbox(context, "Update User",
          "error code ${response.statusCode} : Invalid credential send", () {});
    } else {
      AlertBox.alertbox(context, "Update User", response.body, () {});
    }

  }
}
