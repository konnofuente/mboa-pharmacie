import 'package:flutter/material.dart';
import 'package:mboa_pharmacie/models/Consultant.dart';
import 'package:mboa_pharmacie/utils/navigate_screen.dart';
import 'package:mboa_pharmacie/screens/Consultation/ChatRoom/chat_room.dart';
import 'package:mboa_pharmacie/screens/Consultation/widgets/alert_message_number.dart';

class MessageTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String messagePreview;
  final String time;
  final int unreadCount;
  final Consultant consultant;

  const MessageTile({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.messagePreview,
    required this.time,
    required this.unreadCount,
    required this.consultant
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name),
      subtitle: Text(messagePreview),
      trailing: alertMessageNumber(time, unreadCount),
      onTap: () {
        NavigationScreen.navigate(context, ChatRoom(consultant: consultant));
      },
    );
  }
}
