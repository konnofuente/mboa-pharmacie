import 'package:flutter/material.dart';
import 'package:mboa_pharmacie/models/Consultant.dart';
import 'package:mboa_pharmacie/screens/Consultation/ChatRoom/chat_room.dart';

class ConsultantsListPage extends StatelessWidget {
  // Dummy list of consultants
  final List<Consultant> consultants = [
    Consultant(name: "Dr. Smith", id: "1"),
    Consultant(name: "Dr. Doe", id: "2"),
    // Add more consultants
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consultants")),
      body: ListView.builder(
        itemCount: consultants.length,
        itemBuilder: (context, index) {
          final consultant = consultants[index];
          return ListTile(
            title: Text(consultant.name),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChatRoom(consultant: consultant),
              ));
            },
          );
        },
      ),
    );
  }
}

