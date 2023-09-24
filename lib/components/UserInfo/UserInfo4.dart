import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomDropDown.dart';
import 'package:mobile/components/CustomInput.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:animations/animations.dart';

class UserInfo4 extends StatefulWidget {

  UserInfo4({super.key});
  @override
  State<UserInfo4> createState() => UserInfo4State();
}

class UserInfo4State extends State<UserInfo4> {

  late String HouseStatusInitValue= "";
  late int currentScreen = 0;
  late int currentSelectedID= 0;

  late List<Widget> sceens = [
    getWidget(),
    getWidgetHouseStatus(),
  ];

  getSelecteHouseStatus(value)
  {
    setState(() {
      HouseStatusInitValue = getHouseStatuses()[value].name;
    });
  }
  getWidgetHouseStatus()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: CustomDropDown(reduceWidth: MediaQuery.of(context).size.height/2,Close:CloseDDLHouseStatus ,width: MediaQuery.of(context).size.width,getInput: getSelecteHouseStatus,itemDDL: ddlText,listItems:getHouseStatuses()),
    );
  }

  CloseDDLHouseStatus()
  {
    setState(() {
      currentScreen = 0;
      sceens[0] = getWidget();
    });
  }

  openDDLHouseStatus()
  {
    setState(() {

      sceens[1] = getWidgetHouseStatus();
      currentScreen = 1;
    });
  }

  getWidget()
  {
    return Column(
      children: [

        CustomInput(initialValue:HouseStatusInitValue ,onTap: openDDLHouseStatus,TextInputType: TextInputType.text,Label: "House Status",) ,
        CustomInput(TextInputType: TextInputType.number,Label: "Number of Siblings",) ,
        CustomInput(TextInputType: TextInputType.number,Label: "Number of married siblings ",) ,

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