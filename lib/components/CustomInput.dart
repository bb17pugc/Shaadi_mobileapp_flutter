import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {

  final String? Label;
  final String? hintLabel;
  final Function? getInput,onTap;
  dynamic? icon,initialValue,TextInputType,minLines,maxLines;
  CustomInput({super.key,required TextInputType,this.maxLines=1,this.minLines=1,this.initialValue="",this.onTap=null,this.icon = Icons.input ,this.getInput=null,this.hintLabel="",this.Label=""});
  @override
  State<CustomInput> createState() => CustomInputState();
}

class CustomInputState extends State<CustomInput> {

  @override
  Widget build(BuildContext context) {
    return // Note: Same code is applied for the TextFormField as well
      TextFormField(
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          autovalidateMode: AutovalidateMode.always,
          keyboardType: TextInputType.name,
          initialValue: widget.initialValue!,
          onChanged:(e){
            widget.getInput!(e);
          },
          onTap: ()
          {
            if(widget.onTap != null)
              {
                widget.onTap!();
              }
          },
          decoration: InputDecoration(
    hintText: widget.hintLabel,
    labelText: widget.Label!,
    )
    );
  }
}