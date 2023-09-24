import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomDropDown.dart';
import 'package:mobile/components/CustomInput.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:animations/animations.dart';

class UserInfo5 extends StatefulWidget {

  UserInfo5({super.key});
  @override
  State<UserInfo5> createState() => UserInfo5State();
}

class UserInfo5State extends State<UserInfo5> {


  late String MotherLanguageInitValue= "";
  late int currentScreen = 0;
  late int currentSelectedID= 0;

  late List<Widget> sceens = [
    getWidget(),
    getWidgetDDL(CloseDDLMotherLanguage,getSelecteMotherLanguage,getMotherLanguage),
  ];

  // ddl values for religion started
  getSelecteMotherLanguage(value)
  {
    setState(() {
      MotherLanguageInitValue = getMotherLanguage()[value].name;
    });
  }
  CloseDDLMotherLanguage()
  {
    setState(() {
      currentScreen = 0;
      sceens[0] = getWidget();
    });
  }
  // ddl values for religion ended

  openDDLMotherLanguage()
  {
    setState(() {
      sceens[1] = getWidgetDDL(CloseDDLMotherLanguage,getSelecteMotherLanguage,getMotherLanguage);
      currentScreen = 1;
    });
  }

  getWidgetDDL(Function CloseDDL,Function getSelected,Function getList)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: CustomDropDown(reduceWidth: MediaQuery.of(context).size.height/2,Close:CloseDDL ,width: MediaQuery.of(context).size.width,getInput: getSelected,itemDDL: ddlText,listItems:getList()),
    );
  }

  getWidget()
  {
    return Column(
      children: [
        CustomInput(initialValue:MotherLanguageInitValue ,onTap: openDDLMotherLanguage,TextInputType: TextInputType.text,Label: "Mother Language",) ,
        CustomInput(TextInputType: TextInputType.number,Label: "Applicant’s status among sailings from top",) ,
        CustomInput(TextInputType: TextInputType.text,Label: "Hobby",) ,
        CustomInput(TextInputType: TextInputType.text,Label: "disability",) ,
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