import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/auth/SignUp.dart';
import 'package:mobile/components/AgentInfo/Profile/sections/AgentProfileMainSectionState.dart';
import 'package:mobile/profile/sections/ProfileMainSection.dart';
import 'package:mobile/utils/Colors.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/Language.dart';
import 'package:page_transition/page_transition.dart';

class AgentLogin extends StatefulWidget {
  const AgentLogin({super.key});

  @override
  State<AgentLogin> createState() => AgentLoginState();
}

class AgentLoginState extends State<AgentLogin> {

  late bool _passwordVisible = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome Back" , style: TextStyle(fontSize: 25),),

              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login to your account as Agent" , style: TextStyle(fontSize: 15,color: Colors.grey) ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
            ),
            Container(
              child: TextFormField(

                decoration: InputDecoration(
                  focusColor: PrimaryColor,
                  border: UnderlineInputBorder(
                  ),
                  labelText: 'Phone Number',
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/8,
            ),
            Container(
              child: ElevatedButton(

                onPressed: () {
                  Navigator.push(context, PageTransition(duration: Duration(milliseconds: 500),type: PageTransitionType.rightToLeft, child: AgentProfileMainSection()));
                },
                // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                style: ElevatedButton.styleFrom(
                    primary: PrimaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),

                    textStyle: const TextStyle(color: Colors.white)),
                child: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
              ),
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}