import 'package:flutter/material.dart';

class ProjetScreen extends StatefulWidget {
  const ProjetScreen({Key? key}) : super(key: key);

  @override
  State<ProjetScreen> createState() => _ProjetScreenState();
}

class _ProjetScreenState extends State<ProjetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: LatexScreen(),
        body: Center(
      child: Text(
        "Empty page",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          // color: AppColors.danger
        ),
      ),
    ));
  }
}
