import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../models/models.dart';
import 'message_bubble_widget.dart';

class MessageListWidget extends StatelessWidget {
  final _firestoreService = FirestoreService();
  final _me = AuthService().user.email;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestoreService.getAgentDiscussion(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ChatMessageModel> messages = snapshot.data.docs
                .map((message) => ChatMessageModel.fromMap(message.data()))
                .toList();

            return Expanded(
              child: ListView(
                  reverse: true,
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  children: messages.map((message) {
                    return MessageBubbleWidget(
                      message: message,
                      isMine: message.author == _me,
                    );
                  }).toList()),
            );
          } else {
            return Text('Loading');
          }
        });
  }

}
