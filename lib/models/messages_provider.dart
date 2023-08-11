import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Message> _messages = [];

  List<Message> get messages => _messages;

  Future<void> fetchMessages() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('messages').get();

    _messages = snapshot.docs.map((doc) {
      final data = doc.data();
      return Message(
        id: doc.id,
        text: data['text'],
        userId: data['userId'],
        timestamp: data['timestamp'].toDate(),
      );
    }).toList();

    notifyListeners();
  }

  StreamSubscription<QuerySnapshot>? _messageSubscription;

void listenToMessages() {
  _messageSubscription = FirebaseFirestore.instance
      .collection('messages')
      .orderBy('timestamp', descending: true)
      .snapshots()
      .listen((snapshot) {
    _messages = snapshot.docs.map((doc) {
      final data = doc.data();
      return Message(
        id: doc.id,
        text: data['text'],
        userId: data['userId'],
        timestamp: data['timestamp'].toDate(),
      );
    }).toList();
    notifyListeners();
  });
}

@override
void dispose() {
  _messageSubscription?.cancel();
  super.dispose();
}

  Future<void> sendMessage(String text) async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      await FirebaseFirestore.instance.collection('messages').add({
        'text': text,
        'userId': currentUser.uid,
        'timestamp': FieldValue.serverTimestamp(),
      });

      notifyListeners();
    }
  }
}
