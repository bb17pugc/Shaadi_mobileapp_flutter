import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/ItemChatList.dart';

import '../utils/Colors.dart';

class Chat extends StatefulWidget {

  Chat({super.key});
  @override
  State<Chat> createState() => ChatState();
}

class ChatState extends State<Chat> {


  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height/4,
      child: ListView.builder(
        scrollDirection:Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: (){

            },
            child: ItemChatList(),
          );
        },
      ),
    );
  }
}