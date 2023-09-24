import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mubarak_foods/components/CustomButton.dart';

import '../utils/Constants.dart';
import '../utils/Language.dart';

class ConfirmationPopUp extends StatefulWidget {

  final Function? onClickYes,onClickNo;
  ConfirmationPopUp({super.key,this.onClickYes=null,this.onClickNo=null});
  @override
  State<ConfirmationPopUp> createState() => ConfirmationPopUpState();
}

class ConfirmationPopUpState extends State<ConfirmationPopUp> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      height: (MediaQuery.of(context).size.height),
      color: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
              children: [
                Text(LANGUAGE[0]["are_you_sure"]!,style: TextStyle(fontSize: 20),),
                GAP,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width : 100,
                      child: CustomButton(onPressed: widget.onClickNo!,Label: LANGUAGE[0]["no"]!),
                    ),
                    Container(
                      width : 100,
                      child: CustomButton(backgroundColor: Colors.redAccent,onPressed: widget.onClickYes,Label: LANGUAGE[0]["yes"]!),
                    ),
                  ],
                )

              ],
              ),
            )
        ],
      ),
    );
  }
}