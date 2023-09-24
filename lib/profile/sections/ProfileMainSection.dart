import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/UserMain.dart';
import 'package:mobile/components/UserInfo/UserInfo2.dart';
import 'package:mobile/components/UserInfo/UserInfo3.dart';
import 'package:mobile/components/UserInfo/UserInfo4.dart';
import 'package:mobile/components/UserInfo/UserInfo5.dart';
import 'package:mobile/components/UserInfo/UserInfo6.dart';
import 'package:mobile/components/UserInfo/UserInfo7.dart';
import 'package:mobile/components/UserInfo/UserInfo8.dart';
import 'package:mobile/utils/Constants.dart';

import '../../components/UserInfo/userInfo1.dart';
import 'ProfileSectionBottom.dart';
import 'ProfileSectionTop.dart';
import 'package:animations/animations.dart';
import 'package:page_transition/page_transition.dart';

class ProfileMainSection extends StatefulWidget {
  const ProfileMainSection({super.key});

  @override
  State<ProfileMainSection> createState() => _ProfileMainSectionState();
}

class _ProfileMainSectionState extends State<ProfileMainSection> {
  late GlobalKey<ProfileSectionTopState> profileSectionTopState;
  late int currentScreen = -1;
  late bool reverse = false;
  int totalScreens = 8;
  double stepValue = 0;

  List<Widget> screens = [
    UserInfo1(),
    UserInfo2(),
    UserInfo3(),
    UserInfo4(),
    UserInfo5(),
    UserInfo6(),
    UserInfo7(),
    UserInfo8(),
  ];
  void initState() {
    // TODO: implement initState
    super.initState();
    profileSectionTopState = GlobalKey();
    onClickNext();
  }
  updateProgress({descrease=false})
  {
    stepValue = (100/totalScreens)/100;
    if(descrease == true )
      {
        if(currentScreen == 0)
        {
          return;
        }
        stepValue = stepValue * -1;
        setState(() {
          reverse = true;
          currentScreen = currentScreen == 0 ? 0 : currentScreen-1;
        });


      }
    else
      {
        if(currentScreen == totalScreens-1)
        {
          goToMain();
          return;
        }
        setState(() {
          reverse = false;
          currentScreen = currentScreen == totalScreens-1 ? 0 : currentScreen+1;
        });

      }
    profileSectionTopState.currentState?.updateProgress(stepValue,totalScreens,currentScreen+1);

  }

  onClickNext()
  {
    updateProgress();
  }
  onClickBack()
  {
    updateProgress(descrease:true);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        color: Colors.white,
        padding: SCREEN_PADDING,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*10/100,
                child: ProfileSectionTop(key: profileSectionTopState,stepValue:stepValue,totalScreens:totalScreens,currentScreen:currentScreen),
            ),
            PageTransitionSwitcher(
              duration: Duration(seconds: 1),
              reverse: false,
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
              child:screens[currentScreen]
              ,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*15/100,

              child:ProfileSectionButton(onClickBack: onClickBack,onClickNext: onClickNext,),
            )
          ],
        )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void goToMain() {
    Navigator.push(context, PageTransition(duration: Duration(milliseconds: 500),type: PageTransitionType.rightToLeft, child: UserMain()));
  }

}