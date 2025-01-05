import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/person.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.person});

  Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("chat")),
        body: Center(
            child: ListView.builder(
                itemCount: person.chat.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(person.chat[index]),
                  );
                })));
  }
}
