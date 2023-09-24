import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomInput.dart';
import 'package:animations/animations.dart';

class UserInfo7 extends StatefulWidget {

  UserInfo7({super.key});
  @override
  State<UserInfo7> createState() => UserInfo7State();
}

class UserInfo7State extends State<UserInfo7> {

  late List<Widget> sceens = [
    getWidget(),
  ];



  getWidget()
  {
    return Column(
      children: [
        CustomInput(TextInputType: TextInputType.text,Label: "Nationality",) ,
        CustomInput(TextInputType: TextInputType.text,Label: "State",) ,
        CustomInput(TextInputType: TextInputType.text,Label: "District",) ,
        CustomInput(TextInputType: TextInputType.text,Label: "Tehsil",) ,
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