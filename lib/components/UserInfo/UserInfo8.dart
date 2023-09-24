import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomInput.dart';
import 'package:animations/animations.dart';

class UserInfo8 extends StatefulWidget {

  UserInfo8({super.key});
  @override
  State<UserInfo8> createState() => UserInfo8State();
}

class UserInfo8State extends State<UserInfo8> {


  late List<Widget> sceens = [
    getWidget(),
  ];



  getWidget()
  {
    return Column(
      children: [
        CustomInput(TextInputType: TextInputType.text,Label: "City",) ,
        CustomInput(TextInputType: TextInputType.text,Label: "Permanent Address",minLines: 3,maxLines: 6,) ,
        CustomInput(TextInputType: TextInputType.text,Label: "Set password",) ,
        CustomInput(TextInputType: TextInputType.text,Label: "Retype password",) ,
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