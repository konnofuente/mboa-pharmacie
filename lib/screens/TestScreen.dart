import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Screen", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/Images/profile.png"),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("TestScreen")
        ],
      ),
    );
  }
}
