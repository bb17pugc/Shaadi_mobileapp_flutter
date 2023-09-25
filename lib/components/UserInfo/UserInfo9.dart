import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomDropDown.dart';
import 'package:mobile/components/CustomInput.dart';
import 'package:animations/animations.dart';
import 'package:mobile/utils/Constants.dart';

class UserInfo9 extends StatefulWidget {

  UserInfo9({super.key});
  @override
  State<UserInfo9> createState() => UserInfo8State();
}

class UserInfo8State extends State<UserInfo9> {

  late String PreferenceInitValue= "";

  late List<Widget> sceens = [
    getWidget(),
  ];

  getSelectePreference(value)
  {
    setState(() {
      PreferenceInitValue = getPreference()[value].name;
    });
  }

  getWidget()
  {
    return CustomDropDown(Label: 'Write your Preferences \n (we will exact match for you)',listItems: getPreference());
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