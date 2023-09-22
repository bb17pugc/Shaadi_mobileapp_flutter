import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/Colors.dart';

class CustomButton extends StatefulWidget {
  final Function? onPressed;
  final String? Label;
  late dynamic? backgroundColor = PrimaryColor,clickInput,icon;
  CustomButton({super.key,this.clickInput=0,this.icon = null,this.backgroundColor=const Color(0xff3bb44e),this.Label="Next",this.onPressed=null,});
  @override
  State<CustomButton> createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {


  @override
  Widget build(BuildContext context) {

    return Container(

        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(onPressed: (){
          if (widget.clickInput != 0)
          {
            widget.onPressed!(widget.clickInput);
          }
          else
          {
            widget.onPressed!();
          }
        }, child:
        widget.icon != null  ? widget.icon :
        Text(widget.Label!),style:ButtonStyle(elevation: MaterialStateProperty.all(0),backgroundColor: MaterialStateProperty.all(widget.backgroundColor) , foregroundColor: MaterialStateProperty.all(Colors.white)),
        ));
  }
}