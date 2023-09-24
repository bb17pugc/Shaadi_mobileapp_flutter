import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomDropDown.dart';
import 'package:mobile/components/CustomInput.dart';
import 'package:mobile/components/UploadImages.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:animations/animations.dart';

class UserInfo2 extends StatefulWidget {

  UserInfo2({super.key});
  @override
  State<UserInfo2> createState() => UserInfo2State();
}

class UserInfo2State extends State<UserInfo2> {

  late String genderInitValue= "";
  late int currentScreen = 0;
  late int currentSelectedID= 0;

  late List<Widget> sceens = [
    getWidget(),
    getWidgetGender(),
  ];

  getSelecteGender(value)
  {
    setState(() {
      genderInitValue = getGenders()[value].name;
    });
  }
  getWidgetGender()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: CustomDropDown(reduceWidth: MediaQuery.of(context).size.height/2,Close:CloseDDLGender ,width: MediaQuery.of(context).size.width,getInput: getSelecteGender,itemDDL: ddlText,listItems:getGenders()),
    );
  }

  CloseDDLGender()
  {
    setState(() {
      currentScreen = 0;
      sceens[0] = getWidget();
    });
  }

  openDDLGenders()
  {
    setState(() {

      sceens[1] = getWidgetGender();
      currentScreen = 1;
    });
  }

  getWidget()
  {
    return Column(
      children: [
        UploadImages(),
        CustomInput(initialValue:genderInitValue ,onTap: openDDLGenders,TextInputType: TextInputType.text,Label: "Parents's Status",) ,
        CustomInput(TextInputType: TextInputType.text,Label: "Education",) ,
        CustomInput(TextInputType: TextInputType.text,Label: "Profession",) ,
        CustomInput(TextInputType: TextInputType.text,Label: "Future Goals",) ,

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: Duration(milliseconds: 1000),
      reverse: false,
      transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          ) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          child: child,
        );
      },
      child:sceens[currentScreen]
      ,
    );
  }
}