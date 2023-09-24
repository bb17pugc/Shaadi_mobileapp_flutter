
import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/Message.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:intl/intl.dart';

class ItemChatList extends StatefulWidget {
  final dynamic? dataObject;
  Function? function;
  ItemChatList({this.dataObject=null,this.function=null});
  @override
  State<ItemChatList> createState() => ItemChatListState();
}

class ItemChatListState extends State<ItemChatList>
{
  DateFormat dateFormat = DateFormat("MMMM dd,yyyy");
  late dynamic message = getMessageInstance();
  bool isObjectSet = false;
  late dynamic appUser = getUserInstance();
  late dynamic otherUser = getUserInstance();

  String avatarTitle="";
  String userReciepent = "Username";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setMessageData(widget.dataObject);
    startListeningToFirebase();
    // startListeningToFirebase();
  }


  Widget build(BuildContext context)
  {
    return isObjectSet == false ?
    GestureDetector(
      onTap: (){


        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Chatting(
        //   this.message.conversation_id,
        //   appUser.id.toString(),
        //   otherUser.id.toString(),
        //   this.message.booking_id,
        // )));
      },
      child: Container(

        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: Colors.white,

        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment:  CrossAxisAlignment.center,
              // these properties following the children content height available.
              children: [
                Container(
                  child: CircleAvatar(
                    child: Text("U"),
                  ),
                ),

                Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color:  Colors.white54,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white54,
                          blurRadius: 2,
                          offset: Offset(0, 0), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text("Username",
                                  style: TextStyle(fontSize: 18,fontWeight: appUser.id == this.message.sent_by.id  || int.parse(this.message.status) == READ ? null: FontWeight.w900,color:  Colors.black),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(

                          constraints: BoxConstraints(
                            minWidth: 10.0,
                            maxWidth:  MediaQuery.of(context).size.width/2,
                            minHeight: 20.0,
                            maxHeight: 100.0,
                          ),
                          child: Text("message",
                            style: TextStyle(fontWeight: appUser.id == this.message.sent_by.id  || int.parse(this.message.status) == READ ?  FontWeight.w300: FontWeight.w300,color:  Colors.black),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          child: Text("Sep 7,2002",style: TextStyle(fontSize: 12,color:  Colors.black54),),
                          // child: Text(dateFormat.format(DateTime.parse(message.created_at)) ,
                          //   ),
                        )

                      ],
                    )
                ),
              ],
            )
          ],
        ),
      ) ,
    ): Text("....");
  }

  getMessageStatus(value)
  {
    if(value == "-1")
    {
      return Container(
          width: 10,
          height: 10,
          child: CircularProgressIndicator());
    }
    if(int.parse(value) == SENT)
    {
      return Icon(Icons.check_circle_outline,color: Colors.black26,size: 15,);
    }
    if(int.parse(value) == DELIEVERED)
    {
      return Icon(Icons.check_circle,color: Colors.black26,size: 15,);
    }
    if(int.parse(value) == SEEN)
    {
      return Icon(Icons.check_circle,color: kPrimaryColor,size: 15,);
    }
  }
  void setMessageData(message) {
    print("setting conversation object , ${message}");
    if(mounted)
    {
      setState(() {
        // this.message = Message.fromJsonWithOutParsing(widget.dataObject);
        // isObjectSet = true;
      });

      getUser().then((value){
        // setState(() {
        //   appUser = value;
        //   if(value.id == this.message.sent_by.id)
        //   {
        //
        //     avatarTitle = this.message.sent_to.first_name.toString()[0].toUpperCase();
        //     userReciepent = this.message.sent_to.first_name.toString();
        //     otherUser = this.message.sent_to;
        //   }
        //   else
        //   {
        //     avatarTitle = this.message.sent_by.first_name.toString()[0].toUpperCase();
        //     userReciepent = this.message.sent_by.first_name.toString();
        //     otherUser = this.message.sent_by;
        //   }
        // });
      });

    }
  }

  void startListeningToFirebase() {
    // DatabaseReference ChatsRef =
    // FirebaseDatabase.instance.ref('Chats/${message.conversation_id}/MessageID');
    // ChatsRef.onValue.listen((DatabaseEvent event) {
    //   reloadMessage();
    // });
  }

  void reloadMessage()  async{
    // final Database database = await SqlLiteService().database;
    //
    // print("error found");
    // print("message not found in database");
    // //  getting message from cloud
    // String param = "?conversation_id="+message.conversation_id;
    // String url = BASE_URL+URL_GET_CONVERSATION_BY_ID+param;
    //
    // Api().GET(url).then((value) => {
    //
    //   print("recieved status"),
    //   print(value.statusCode),
    //   if(mounted)
    //     {
    //       setState(() {
    //         this.message = Message.fromJsonWithOutParsing(json.decode(value.body));
    //       }),
    //     }
    // });

  }

  void setMessageObject(dynamic message) {
    print("message obj from database");
    print(message['id']);
    // setState(() {
    //   this.message = message;
    // });
  }

// removeMessageReload() {
//   DatabaseReference MessagesRef =
//   FirebaseDatabase.instance.ref('Chats/Reloads/${widget.message.conversation_id}/${widget.message.messsage_id}');
//   MessagesRef.remove();
// }
}
