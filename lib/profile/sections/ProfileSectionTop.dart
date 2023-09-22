import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfileSectionTop extends StatefulWidget {
  double get value => 0.0;

  updateProgress(value) => ProfileSectionTopState().updateProgress(value);
  ProfileSectionTop({super.key});
  @override
  State<ProfileSectionTop> createState() => ProfileSectionTopState();
}

class ProfileSectionTopState extends State<ProfileSectionTop> {

 double progressPercentage = 0.0;
  updateProgress(double value)
  {

        setState(() {
          progressPercentage = value;
        });
        print(value);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width,
              animation: true,
              lineHeight: 5.0,
              animationDuration: 2500,
              percent: progressPercentage,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.green,
            )
          ],
        )
    );
  }
}