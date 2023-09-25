import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomInput.dart';
import 'package:animations/animations.dart';

class AgentInfo3 extends StatefulWidget {

  AgentInfo3({super.key});
  @override
  State<AgentInfo3> createState() => AgentInfo3State();
}

class AgentInfo3State extends State<AgentInfo3> {


  late List<Widget> sceens = [
    getWidget(),
  ];



  getWidget()
  {
    return Column(
      children: [
        CustomInput(TextInputType: TextInputType.text,Label: "Date Of Birth",) ,
        CustomInput(TextInputType: TextInputType.text,Label: "Permanent Address",minLines: 3,maxLines: 6,) ,
        CustomInput(TextInputType: TextInputType.phone,Label: "Mobile",) ,
        CustomInput(TextInputType: TextInputType.number,Label: "ID Card Number",) ,
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
      child:sceens[0]
      ,
    );
  }
}