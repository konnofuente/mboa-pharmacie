import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:mboa_pharmacie/models/Consultant.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

// Define your Consultant model if not already defined


class ChatRoom extends StatefulWidget {
  final Consultant consultant;

  const ChatRoom({Key? key, required this.consultant}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  List<types.Message> messages = [];
  late types.User user;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    user = types.User(id: widget.consultant.id);
    // Initialize your user here and load existing messages if any
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'id',
      text: message.text,
    );

    setState(() {
      messages.insert(0, textMessage);
    });

    // Implement your logic to send the message to your backend or chat service
  }

  void _handleAttachmentPressed() {
    // Implement your logic for when the user wants to send an attachment
    // For example, picking an image from the gallery or taking a new photo
  }

  Future<void> _handleImageSelection() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Create a message type with the image and add it to the chat
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.consultant.name),
      ),
      body: Chat(
        messages: messages,
        onSendPressed: _handleSendPressed,
        user: user,
        onAttachmentPressed: _handleAttachmentPressed,
        // Define other event handlers and properties as needed
      ),
    );
  }
}
