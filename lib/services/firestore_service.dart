import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_service.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();
  FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;
  AuthService authService = AuthService();

  sendMessage(String message) async {

    await _firestoreInstance.collection('chat-messages').add({
      'author': '${authService.user.email}',
      'message': '$message',
      'time': '${DateTime.now().millisecondsSinceEpoch}'
    });
  }
  Stream<QuerySnapshot> getAgentDiscussion(){
    return _firestoreInstance.collection('chat-messages')
        .orderBy("time", descending: true).snapshots();
  }

}