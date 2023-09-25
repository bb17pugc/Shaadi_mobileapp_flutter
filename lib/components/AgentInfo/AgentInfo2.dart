import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomDropDown.dart';
import 'package:mobile/components/CustomInput.dart';
import 'package:mobile/components/UploadImages.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:animations/animations.dart';

class AgentInfo2 extends StatefulWidget {

  AgentInfo2({super.key});
  @override
  State<AgentInfo2> createState() => AgentInfo2State();
}

class AgentInfo2State extends State<AgentInfo2> {

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
        CustomInput(TextInputType: TextInputType.text,Label: "Occupation",) ,
        CustomInput(TextInputType: TextInputType.number,Label: "Age",) ,
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