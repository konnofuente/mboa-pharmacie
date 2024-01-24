

import 'package:flutter/material.dart';

import '../../models/Item.dart';

class GetTrailers extends StatelessWidget {
  final Item item;

  GetTrailers(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            child: Image.asset(
              item.trailerImg1,
              width: 160.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5.0),
            child: Image.asset(
              item.trailerImg2,
              width: 160.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5.0),
            child: Image.asset(
              item.trailerImg3,
              width: 160.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
