import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/UserInfo/userInfo1.dart';
import 'ProfileSectionBottom.dart';
import 'ProfileSectionTop.dart';

class ProfileMainSection extends StatefulWidget {
  const ProfileMainSection({super.key});

  @override
  State<ProfileMainSection> createState() => _ProfileMainSectionState();
}

class _ProfileMainSectionState extends State<ProfileMainSection> {

  int totalScreens = 8;
  double stepValue = 0;

  updateProgress()
  {
    stepValue = stepValue + 1/(100/totalScreens);
    // ProfileSectionTop().updateProgress();
  }

  onClickNext()
  {
    updateProgress();
  }
  onClickBack()
  {
    print("on click back is called");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              height: 290,
                child: UserInfo1()),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*10/100,
                // child: topSection.ProfileSectionTop(),
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
}