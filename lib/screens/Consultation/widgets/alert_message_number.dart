  import 'package:flutter/material.dart';

Widget alertMessageNumber(String time, int unreadCount) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(time),
        SizedBox(width: 8),
        if (unreadCount > 0)
          CircleAvatar(
            backgroundColor: Colors.green, // Use your theme color here
            radius: 12,
            child: Text(
              unreadCount.toString(),
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
      ],
    );
  }