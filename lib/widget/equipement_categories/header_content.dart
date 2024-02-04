import 'package:flutter/material.dart';
import '../../models/DrugCategories.dart';

class HeaderContent extends StatelessWidget {
  final DrugCategories equipment_categories;

  HeaderContent(this.equipment_categories);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        color: Colors.black.withOpacity(0.7),
        constraints: BoxConstraints.expand(
          height: 110.0,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 1.0),
                        child: Text(
                          equipment_categories.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
                        child: Text(
                          equipment_categories.desc!,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                        child: Text(
                          equipment_categories.directors!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //child:
        ),
      ),
    );
  }
}
