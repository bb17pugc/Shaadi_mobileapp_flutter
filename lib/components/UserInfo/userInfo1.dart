import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo1 extends StatefulWidget {

  UserInfo1({super.key});
  @override
  State<UserInfo1> createState() => UserInfo1State();
}

class UserInfo1State extends State<UserInfo1> {


  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
              decoration:
                InputDecoration(
                  border:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(
                        color:Colors.deepOrange
                      )
                    )
                ),
              ),
              Container(height: 25,),
              TextField(
                decoration:
                InputDecoration(
                    border:
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(
                            color:Colors.deepOrange
                        )
                    )
                ),
              ),
            ],
          ),
        ));
  }
}