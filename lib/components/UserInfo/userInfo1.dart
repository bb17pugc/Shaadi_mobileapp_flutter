import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo1 extends StatefulWidget {

  UserInfo1({super.key});
  @override
  State<UserInfo1> createState() => UserInfo1State();
}

class UserInfo1State extends State<UserInfo1> {
  var user_name = TextEditingController();
  var Father_name = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name"),
                  SizedBox(height: 5,),
                  TextField(
                    controller: user_name,
                  decoration:
                    InputDecoration(
                      focusedBorder:
                      OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(
                              color:Colors.deepOrange,
                            width:1.4
                          )
                      ) ,
                      enabledBorder:
                      OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                                color:Colors.blueAccent,
                                width:1.4
                            )
                        ),




                                      ),
                  ),
                ],
              ),
              Container(height: 25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Father's Name"),
                  SizedBox(height: 5,),
                  TextField(
                    controller: user_name,
                    decoration:
                    InputDecoration(
                      focusedBorder:
                      OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(
                              color:Colors.deepOrange,
                              width:1.4
                          )
                      ) ,
                      enabledBorder:
                      OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(
                              color:Colors.blueAccent,
                              width:1.4
                          )
                      ),




                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}