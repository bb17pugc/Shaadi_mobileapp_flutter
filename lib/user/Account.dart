import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/auth/SignIn.dart';
import 'package:mobile/components/UploadImages.dart';
import 'package:mobile/utils/Constants.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/Colors.dart';

class Account extends StatefulWidget {

  Account({super.key});
  @override
  State<Account> createState() => AccountState();
}

class AccountState extends State<Account> {

  List<String> items = [
    "Subscribe",
    "Agents",
    "Contact Us",
    "Sign Out",
  ];
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        width: (MediaQuery.of(context).size.width),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Image.network(PLACEHOLDER_IMAGE,
                fit: BoxFit.fitHeight,
                width: 200,height: 200,),
            ),
            GAP,
            Container(
                height: 100,
              child: ListView.builder(
                  itemCount:4,
                  scrollDirection:Axis.horizontal,
                  key: new Key(DateTime.now().toString()),
                  itemBuilder: (context, i){
                    return GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, PageTransition(duration: Duration(milliseconds: 500),type: PageTransitionType.rightToLeft, child: SignIn()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 80,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 6,
                                offset: Offset(0, 1), // changes position of shadow
                              ),
                            ]
                        ),

                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.subscriptions_outlined,color: PrimaryColor,),
                            Text(items[i].toString())
                          ],
                        ),
                      ),
                    );
                  }

              ),
            ),

            Text("Personal Info",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
            GAP,
            Container(
              child: Column(
                children: [

                  // item user info started---
                  Container(
                    decoration: BoxDecoration(
                      border: Border(top : BorderSide(width: 0.3,color: Colors.black54))
                    ),
                    padding:EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
                        Text("Ali",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        border: Border(top : BorderSide(width: 0.3,color: Colors.black54))
                    ),
                    padding:EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Fathers Name ",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
                        Text("Zahid",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        border: Border(top : BorderSide(width: 0.3,color: Colors.black54))
                    ),
                    padding:EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Parent Status",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
                        Text("Alive",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                      ],
                    ),
                  )
                ],
              ),
            ),
            GAP,
            Text("More Info",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
            Container(
              child: Column(
                children: [

                  // item user info started---
                  Container(
                    decoration: BoxDecoration(
                        border: Border(top : BorderSide(width: 0.3,color: Colors.black54))
                    ),
                    padding:EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Martial Status",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
                        Text("Single",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        border: Border(top : BorderSide(width: 0.3,color: Colors.black54))
                    ),
                    padding:EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cast",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
                        Text("Jutt",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        border: Border(top : BorderSide(width: 0.3,color: Colors.black54))
                    ),
                    padding:EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Profession",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
                        Text("Police Man",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   width: (MediaQuery.of(context).size.width),
            //   decoration: BoxDecoration(
            //       border: Border(top : BorderSide(width: 0.3,color: Colors.black54))
            //   ),
            //   padding:EdgeInsets.all(10),
            //   child:Text("More Info is hidden",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14),),
            // ),
          ],
        ),
      ),
    );
  }
}