import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class isLoadingIndicator {

  static Widget CircularLoading(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
        CircularProgressIndicator(),
        SizedBox(height: 10,),
        Text(error)
        ]
      ),
    );
  }

  static Future<void> transparentLoading(BuildContext context)async {
        showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
  }
}
