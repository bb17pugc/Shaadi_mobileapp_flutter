

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextBox extends StatefulWidget {
  InputTextBox();
  @override
  State<InputTextBox> createState() => _InputTextBoxState();
}

class _InputTextBoxState extends State<InputTextBox>
{
  Widget build(BuildContext context){
    return TextField(
        onTap: (){}
    );
  }
}