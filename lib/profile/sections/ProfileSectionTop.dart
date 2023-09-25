import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/Colors.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:animations/animations.dart';

class ProfileSectionTop extends StatefulWidget {
  final dynamic stepValue,totalScreens,currentScreen;
  ProfileSectionTop({super.key,this.stepValue,this.totalScreens,this.currentScreen});
  @override
  State<ProfileSectionTop> createState() => ProfileSectionTopState();
}

class ProfileSectionTopState extends State<ProfileSectionTop> {

 double progressPercentage = 0.0;
 int totalScreens = 0;
 int current=  0;

 void initState() {
   // TODO: implement initState
   super.initState();
   print("init is calling");

   setState(() {
     progressPercentage =widget.stepValue;
     totalScreens = widget.totalScreens;
     this.current = widget.currentScreen+1;
   });
 }

  updateProgress(double value,total,int current)
  {

        setState(() {
          progressPercentage =progressPercentage + value;
          totalScreens = total;
          this.current = current;
        });
        print(value);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GAP,
            PageTransitionSwitcher(
              duration: Duration(milliseconds: 1500),
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
              child: new LinearPercentIndicator(
                barRadius: Radius.circular(100),
                animation: true,
                lineHeight: 5.0,
                addAutomaticKeepAlive : true,
                animationDuration: 1,
                percent: progressPercentage,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: PrimaryColor,
              )
              ,
            ),
            Text((current).toString()+"/"+totalScreens.toString())
          ],
        )
    );
  }
}