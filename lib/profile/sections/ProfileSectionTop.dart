import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfileSectionTop extends StatefulWidget {
  const ProfileSectionTop({super.key});

  @override
  State<ProfileSectionTop> createState() => _ProfileSectionTopState();
}

class _ProfileSectionTopState extends State<ProfileSectionTop> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: new LinearPercentIndicator(
            width: MediaQuery.of(context).size.width,
            animation: true,
            lineHeight: 10.0,
            animationDuration: 2500,
            percent: 0.8,
            center: Text("80.0%",style: TextStyle(color: Colors.white),),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.green,
          )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}