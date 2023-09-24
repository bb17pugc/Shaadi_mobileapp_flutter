import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/BottonNavigationbar.dart';
import 'package:mobile/user/Account.dart';
import 'package:mobile/user/Chat.dart';
import 'package:mobile/user/Home.dart';
import 'package:mobile/user/Proposal.dart';
import 'package:animations/animations.dart';
import 'package:mobile/utils/Colors.dart';

class UserMain extends StatefulWidget {

  UserMain({super.key});
  @override
  State<UserMain> createState() => UserMainState();
}

class UserMainState extends State<UserMain> {

  int currentScreen = 0;
  bool isReverse = false;

  List<Widget> screens = [
    Home(),
    Proposal(),
    Chat(),
    Account(),
  ];

  List<String> titles = [
    "Home",
    "Proposal",
    "Chat",
    "Account",
  ];

  onClickHome()
  {
      setState(() {
        isReverse =  currentScreen > 0 ? true : false;
        currentScreen = 0;
      });
  }
  onClickChat()
  {

    setState(() {
      isReverse =  currentScreen > 2 ? true : false;
      currentScreen = 2;
    });
  }
  onClickAccount()
  {
    setState(() {
      currentScreen = 3;
    });
  }
  onClickProposal()
  {
    setState(() {
      isReverse =  currentScreen > 1 ? true : false;
      currentScreen = 1;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(titles[currentScreen]),
        elevation: 0,
      ),
      body:PageTransitionSwitcher(
        duration: Duration(milliseconds: 500),
        reverse: isReverse,
        transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child:screens[currentScreen],
      ),

      bottomNavigationBar: BottomNavigation(
          onClickHome: onClickHome,
        onClickAccount: onClickAccount,
        onClickChat: onClickChat,
        onClickProposal: onClickProposal,
        currentSelected: currentScreen,
      ),
    );
  }
}