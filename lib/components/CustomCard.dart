import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/Constants.dart';

class CustomCard extends StatefulWidget {

  final dynamic? labelTextSize,borderRadius,width;
  final double iconSize,opacity;
  final dynamic? backgroundColor,labelTextColor,direction,icon,iconColor,Label;
  CustomCard({super.key,this.opacity=0.5,this.width=20,this.labelTextColor=Colors.white,this.Label="Label",this.iconColor=Colors.white,this.icon=Icons.insert_emoticon,this.direction=DIRECTION_HORIZONTAL,this.backgroundColor=Colors.white,this.iconSize =20,this.labelTextSize=20,this.borderRadius=20});
  @override
  State<CustomCard> createState() => CustomCardState();

}

class CustomCardState extends State<CustomCard> {

  @override
  Widget build(BuildContext context) {
      return Container(
        width: double.parse(widget.width.toString()),

        padding: SCREEN_PADDING,
          decoration: BoxDecoration(
              color: widget.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(double.parse(widget.borderRadius.toString()!) )),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(widget.opacity!),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ]
          ),
          child:
          widget.direction == DIRECTION_HORIZONTAL ?
          Row(
            children: [
              GAP,
              widget.icon is int || widget.icon is double   ?  Text(widget.icon.toString(),style: TextStyle(fontSize: double.parse(widget.iconSize.toString()),color: widget.iconColor)) :
              Icon(widget.icon,size: widget.iconSize!,color: widget.iconColor,),
              GAP,
              Text(widget.Label!,style: TextStyle(color: widget.labelTextColor),),
              GAP,
            ],
          )
              :
          Column(
            children: [
              GAP,
              widget.icon is int || widget.icon is double ?  Text(widget.icon.toString(),style: TextStyle(fontSize: double.parse(widget.iconSize.toString()),color: widget.iconColor)) :
              Icon(widget.icon,size: widget.iconSize!,color: widget.iconColor,),
                  GAP,
              Container(
                alignment: Alignment.center,
                child:Text(widget.Label!,textAlign: TextAlign.center,style: TextStyle(fontSize: double.parse(widget.labelTextSize.toString()),color: widget.labelTextColor),),
              ),
              GAP,
            ],
          ),
      );
  }
}