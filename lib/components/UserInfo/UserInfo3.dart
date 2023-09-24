import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:mobile/components/CustomDropDown.dart';
import 'package:mobile/components/CustomInput.dart';
import 'package:mobile/utils/Constants.dart';

class UserInfo3 extends StatefulWidget {

  UserInfo3({super.key});
  @override
  State<UserInfo3> createState() => UserInfo3State();
}

class UserInfo3State extends State<UserInfo3> {


  late String maritalstatusInitValue= "";
  late String relegionInitValue= "";

  late int currentScreen = 0;
  late int currentSelectedID= 0;

  late List<Widget> sceens = [
    getWidget(),
    getWidgetDDL(CloseDDLRelegion,getSelecteRelegion,getRelegion),
  ];

  // ddl values for religion started
  getSelecteRelegion(value)
  {
    setState(() {
      relegionInitValue = getRelegion()[value].name;
    });
  }
  CloseDDLRelegion()
  {
    setState(() {
      currentScreen = 0;
      sceens[0] = getWidget();
    });
  }
  // ddl values for religion ended

  // ddl values for martial statuses started
  getSelecteMaritalstatus(value)
  {
    setState(() {
      maritalstatusInitValue = getMaritalstatus()[value].name;
    });
  }
  CloseDDLMaritalstatus()
  {
    setState(() {
      currentScreen = 0;
      sceens[0] = getWidget();
    });
  }
  // ddl values for martial statuses ended

  openDDLMartialStatus()
  {
    setState(() {
      sceens[1] = getWidgetDDL(CloseDDLMaritalstatus,getSelecteMaritalstatus,getMaritalstatus);
      currentScreen = 1;
    });
  }

  openDDLRelegion()
  {
    setState(() {
      sceens[1] = getWidgetDDL(CloseDDLRelegion,getSelecteRelegion,getRelegion);
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
        CustomInput(initialValue:maritalstatusInitValue ,onTap: openDDLMartialStatus,TextInputType: TextInputType.text,Label: "Martials's Status",) ,
        CustomInput(TextInputType: TextInputType.text,Label: "Date of birth",) ,
        CustomInput(initialValue: relegionInitValue,onTap: openDDLRelegion,TextInputType: TextInputType.text,Label: "Religion",) ,
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