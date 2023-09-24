
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/profile/ViewPersonProfile.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:page_transition/page_transition.dart';

class ItemPerson extends StatefulWidget {

  Function?function;
  dynamic userService;
  ItemPerson({this.userService,this.function = null});
  @override
  State<ItemPerson> createState() => ItemPersonState();
}

class ItemPersonState extends State<ItemPerson>
{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: () async {
        Navigator.push(context, PageTransition(duration: Duration(milliseconds: 500),type: PageTransitionType.rightToLeft, child: ViewPersonProfile()));

      },
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
              child: Container(

                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                ),
                width : (MediaQuery.of(context).size.width/2.2),
                margin: EdgeInsets.only(bottom: 5 , top: 5),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [


                    Container(
                      child: Stack(
                        textDirection : TextDirection.rtl,
                        clipBehavior: Clip.none,
                        children: [
                          Image.network(PLACEHOLDER_IMAGE,
                            width: (MediaQuery.of(context).size.width) ,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child:
                            Container(
                              constraints: BoxConstraints(
                                minWidth: 10.0,
                                maxWidth:  (MediaQuery.of(context).size.width/3) ,
                              ),
                              padding: EdgeInsets.only(left: 5,right: 5),
                              color: Colors.brown,
                              child:Text("city",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white),),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(

                      width: (MediaQuery.of(context).size.width) ,
                      padding: EdgeInsets.only(left: 2),
                      child: Text("Username",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: new TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Roboto',
                          color:Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 2),
                        width: (MediaQuery.of(context).size.width) ,
                      child: Text("Qualification",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: new TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Roboto',
                        color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

}
