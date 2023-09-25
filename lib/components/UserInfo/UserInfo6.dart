import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomDropDown.dart';
import 'package:mobile/components/CustomInput.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:animations/animations.dart';

class UserInfo6 extends StatefulWidget {

  UserInfo6({super.key});
  @override
  State<UserInfo6> createState() => UserInfo6State();
}

class UserInfo6State extends State<UserInfo6> {


  late String IncomeTypeInitValue= "";
  late int currentScreen = 0;
  late int currentSelectedID= 0;

  late List<Widget> sceens = [
    getWidget(),
    getWidgetDDL(CloseDDLIncomeType,getSelecteIncomeType,getIncomeType),
  ];

  // ddl values for religion started
  getSelecteIncomeType(value)
  {
    setState(() {
      IncomeTypeInitValue = getIncomeType()[value].name;
    });
  }
  CloseDDLIncomeType()
  {
    setState(() {
      currentScreen = 0;
      sceens[0] = getWidget();
    });
  }
  // ddl values for religion ended

  openDDLIncomeType()
  {
    setState(() {
      sceens[1] = getWidgetDDL(CloseDDLIncomeType,getSelecteIncomeType,getIncomeType);
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
        CustomInput(initialValue:IncomeTypeInitValue ,onTap: openDDLIncomeType,TextInputType: TextInputType.text,Label: "Income Type",) ,
        CustomInput(TextInputType: TextInputType.number,Label: "Write your "+IncomeTypeInitValue+" income (PKR)",) ,

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