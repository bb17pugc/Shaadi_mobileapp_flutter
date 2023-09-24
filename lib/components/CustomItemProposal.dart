

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/profile/ViewPersonProfile.dart';
import 'package:mobile/utils/Colors.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:info_popup/info_popup.dart';
import 'package:animations/animations.dart';

import 'package:page_transition/page_transition.dart';


class CustomItemProduct extends StatefulWidget {

  final dynamic? item;
  final Function? onClick;
  final bool isShopkeeper;
  CustomItemProduct({super.key,this.isShopkeeper=true,this.item=null,this.onClick=null});
  @override
  State<CustomItemProduct> createState() => CustomItemProductState();
}

class CustomItemProductState extends State<CustomItemProduct> {

  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
          onTap: (){


            // if(widget.onClick != null)
            // {
            //   widget.onClick!();
            // }
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ]
            ),
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
                minHeight: 100),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width/3),
                      height: 100,
                      margin: EdgeInsets.all(5),
                      child:Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              child:
                              Stack(
                                children: [
                                  Container(
                                    height: 100,
                                    child: Image.network(

                                      PLACEHOLDER_IMAGE,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),

                                ],
                              )


                          ),
                          Positioned(
                              right: 3,
                              bottom: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 6,
                                        offset: Offset(0, 1), // changes position of shadow
                                      ),
                                    ]
                                ),

                                padding: SCREEN_PADDING,
                                child: Text("3h ago"),
                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: (MediaQuery.of(context).size.width/3)*1.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: (MediaQuery.of(context).size.width),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: (MediaQuery.of(context).size.width*.7)-100,
                                      constraints: BoxConstraints(
                                          maxHeight: (MediaQuery.of(context).size.width)-100),
                                      child:Text("Username",style: TextStyle(overflow: TextOverflow.ellipsis
                                          ,color: Colors.black,fontWeight: FontWeight.w400,fontSize:18),),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child:
                                Text("Qualification",style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black87,fontWeight: FontWeight.normal,fontSize:12),),
                              ),

                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),

                Positioned(
                    right: 5,
                    top: 5,
                    child:
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, PageTransition(duration: Duration(milliseconds: 500),type: PageTransitionType.rightToLeft, child: ViewPersonProfile()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ]
                      ),
                      child: Icon(Icons.directions,color: PrimaryColor,),
                    )
                )
                ),
                Positioned(
                right: 10,
                    bottom: 10,
                    child:
                widget.isShopkeeper
                    ?

                PageTransitionSwitcher(
                  duration: Duration(seconds: 1),
                  reverse: false,
                  transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      ) {
                    return SharedAxisTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                      child: child,
                    );
                  },
                  child:  isAccepted == false ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: PrimaryColor,
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: Offset(0, 1), // changes position of shadow
                                ),
                              ]
                          ),
                          child:
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isAccepted = true;
                              });
                            },
                            child: Text("Accept",style: TextStyle(color: Colors.white,fontSize:12),),
                          ),
                        ),
                        Text("    "),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: Offset(0, 1), // changes position of shadow
                                ),
                              ]
                          ),
                          child: Text("Cancel",style: TextStyle(color: Colors.red,fontSize:12),),
                        ),
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: Offset(0, 1), // changes position of shadow
                                ),
                              ]
                          ),
                          child:
                          GestureDetector(
                            onTap: (){

                            },
                            child: Icon(Icons.call,color: PrimaryColor,),
                          ),
                        ),
                        Text("    "),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: Offset(0, 1), // changes position of shadow
                                ),
                              ]
                          ),
                          child: Icon(Icons.message,color: PrimaryColor,),),

                      ],
                    ),
                )
                 :
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                            widget.onClick!(ADD_TO_CART);
                      },
                      child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: Offset(0, 1), // changes position of shadow
                                ),
                              ]
                          ),
                          child:Icon(Icons.add_shopping_cart,color: Colors.grey,size: 25)
                      ),
                    )

                  ],
                )
                )
              ],
            ),
          ),
        );

  }
}