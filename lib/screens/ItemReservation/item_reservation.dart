import 'package:flutter/material.dart';

class ItemReservation extends StatefulWidget {
  const ItemReservation({Key? key}) : super(key: key);

  @override
  State<ItemReservation> createState() => _ItemReservationState();
}

class _ItemReservationState extends State<ItemReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: LatexScreen(),
        body: Center(
      child: Text(
        "PAs de reservation",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          // color: AppColors.danger
        ),
      ),
    ));
  }
}
