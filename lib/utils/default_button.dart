import 'package:flutter/material.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {Key? key,
      required this.text,
      required this.press,
      this.taille = 250,
      this.bgColor = Colors.blue,
      this.textColor = Colors.white})
      : super(key: key);
  final String text;
  final double taille;
  final Function press;
  final Color bgColor;
  final Color textColor;
  bool disabled = false;

  @override
  Widget build(BuildContext context) {
    ElevatedButton button = ElevatedButton(
      style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        // side: BorderSide(
        //   width: 1,
        //   color: Colors.black54,
        //   style: BorderStyle.solid,
        // ),
      ),
      // backgroundColor: bgColor,
      textStyle: TextStyle(
        color: textColor,
      )
      ),
      // onPressed: press,
      onPressed: () {  },
      child: Text(
        text,
        style: TextStyle(
            // fontSize: getProportionateScreenWidth(18),
            color: textColor,
            fontWeight: FontWeight.bold),
      ),
    );
    return SizedBox(
        // width: taille,
        width: MediaQuery.of(context).size.width,
        height: 58,
        child: button);
  }
}
