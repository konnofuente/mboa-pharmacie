import 'package:flutter/material.dart';
import 'package:mboa_pharmacie/models/Consultant.dart';
import 'package:mboa_pharmacie/utils/navigate_screen.dart';
import 'package:mboa_pharmacie/screens/Consultation/ChatRoom/chat_room.dart';
import 'package:mboa_pharmacie/screens/Consultation/widgets/message_tile.dart';
import 'package:mboa_pharmacie/screens/Consultation/widgets/alert_message_number.dart';

class ConsultantsListPage extends StatelessWidget {
  // Dummy list of consultants
  final List<Consultant> consultants = [
    Consultant(
      name: "Dermatologist",
      messagePreview: "Can you recommend a skin cream?",
      imageUrl:
          "https://cariblens.com/wp-content/uploads/2020/10/portrait-african-american-doctor-hospital_181624-14429.jpg",
      time: "11:30",
      unreadCount: 2,
    ),
    Consultant(
      name: "Psychiatrist",
      messagePreview: "I'm feeling anxious lately.",
      imageUrl:
          "https://th.bing.com/th/id/R.ec6373432c8e892311c515fefffb15c5?rik=BgfAcyBdJw2WqA&riu=http%3a%2f%2fak5.picdn.net%2fshutterstock%2fvideos%2f7000456%2fthumb%2f1.jpg%3fi10c%3dimg.resize(height%3a160)&ehk=DvWG6bl8NvjKoL0Ub92%2bCfkr1hbpj%2bLVBpAC%2f%2b9u%2ftU%3d&risl=&pid=ImgRaw&r=0",
      time: "09:45",
      unreadCount: 0,
    ),
    Consultant(
      name: "Nutritionist",
      messagePreview: "What should I eat for better health?",
      imageUrl:
          "https://th.bing.com/th/id/OIP.Ss3P-l2aDFiQRpgJtjD8dAHaE8?w=768&h=512&rs=1&pid=ImgDetMain",
      time: "07:55",
      unreadCount: 4,
    ),
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: ListView.builder(
        itemCount: consultants.length,
        itemBuilder: (context, index) {
          final consultant = consultants[index];
          return MessageTile(
          imageUrl: consultant.imageUrl,
          name: consultant.name,
          messagePreview: consultant.messagePreview,
          time: consultant.time,
          unreadCount: consultant.unreadCount,
          consultant: consultant,
        );
        },
      ),
    );
  }

}

