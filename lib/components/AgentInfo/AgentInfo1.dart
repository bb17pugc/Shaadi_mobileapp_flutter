import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomDropDown.dart';
import 'package:mobile/components/CustomInput.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:animations/animations.dart';

class AgentInfo1 extends StatefulWidget {

  AgentInfo1({super.key});
  @override
  State<AgentInfo1> createState() => AgentInfo1State();
}

class AgentInfo1State extends State<AgentInfo1> {
  var user_name = TextEditingController();
  var Father_name = TextEditingController();
  late int currentScreen = 0;
  late String locationInitValue= "";

  late List<Widget> sceens = [
    getWidget(),
    getWidgetParentsStatuses(),
  ];

  openParentsStatuses()
  {
    setState(() {

      sceens[1] = getWidgetParentsStatuses();
      currentScreen = 1;
    });
  }
  CloseDDLAddress()
  {
    setState(() {
      currentScreen = 0;
      sceens[0] = getWidget();
    });
  }

  getWidget()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInput(TextInputType: TextInputType.text,Label: "Name",) ,
              CustomInput(TextInputType: TextInputType.text,Label: "Father's Name",) ,
              CustomInput(TextInputType: TextInputType.text,Label: "Education",) ,
            ],
          ),
        ],
      ),
    );
  }
  getSelecteParentStatus(value)
  {
    setState(() {
      locationInitValue = getParentsStatus()[value].name;
    });
  }
  getWidgetParentsStatuses()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: CustomDropDown(reduceWidth: MediaQuery.of(context).size.height/2,Close:CloseDDLAddress ,width: MediaQuery.of(context).size.width,getInput: getSelecteParentStatus,itemDDL: ddlText,listItems:getParentsStatus()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: SCREEN_PADDING,
      child: PageTransitionSwitcher(
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
      ),
    );


  }
}