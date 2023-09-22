import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomButton.dart';

class ProfileSectionButton extends StatefulWidget {

  final Function? onClickNext , onClickBack;
  ProfileSectionButton({super.key,this.onClickBack=null,this.onClickNext=null});
  @override
  State<ProfileSectionButton> createState() => ProfileSectionButtonState();
}

class ProfileSectionButtonState extends State<ProfileSectionButton> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
          Container(
            width: MediaQuery.of(context).size.width*30/100,
            child: CustomButton(onPressed: widget.onClickBack,Label: "Back",),
          ),
          Container(
            width: MediaQuery.of(context).size.width*30/100,
            child:CustomButton(onPressed: widget.onClickNext),
          )
      ],
    );
  }
}