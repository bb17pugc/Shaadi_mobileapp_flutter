import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/auth/SignUp.dart';
import 'package:mobile/profile/sections/ProfileMainSection.dart';
import 'package:mobile/utils/Colors.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:mobile/utils/Language.dart';
import 'package:page_transition/page_transition.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
                Text("Login to your account" , style: TextStyle(fontSize: 15,color: Colors.grey) ),
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
                  labelText: 'Email or Username',
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 20,
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText:!_passwordVisible,
                decoration: InputDecoration(
                  focusColor: PrimaryColor,
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                    suffixIcon:  IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,

                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )
                ),

              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/8,
            ),
            Container(
              child: ElevatedButton(

                onPressed: () {
                  Navigator.push(context, PageTransition(duration: Duration(milliseconds: 500),type: PageTransitionType.rightToLeft, child: ProfileMainSection()));
                },
                // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                style: ElevatedButton.styleFrom(
                    primary: PrimaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),

                    textStyle: const TextStyle(color: Colors.white)),
                child: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
              ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(

                 child: Text(LANGUAGE[0]["create_new_account"]!,style: TextStyle(color: Colors.grey),),
               ),
               SizedBox(
                 width: 5,
                 height: 0,
               ),
               Container(
                 child: GestureDetector(
                   onTap: ()
                   {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingUp()));

                   },
                   child: Text(LANGUAGE[0]["sign_up"]! ,style: TextStyle(color: PrimaryColor)),
                 ),
               )
             ],
           )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}