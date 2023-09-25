import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/BottonNavigationbar.dart';
import 'package:mobile/components/CustomCard.dart';
import 'package:mobile/components/DrawerUser.dart';
import 'package:mobile/user/Account.dart';
import 'package:mobile/user/Chat.dart';
import 'package:mobile/user/Home.dart';
import 'package:mobile/user/Proposal.dart';
import 'package:animations/animations.dart';
import 'package:mobile/utils/Colors.dart';
import 'package:mobile/utils/Constants.dart';

class UserMain extends StatefulWidget {

  UserMain({super.key});
  @override
  State<UserMain> createState() => UserMainState();
}

class UserMainState extends State<UserMain> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int currentScreen = 0;
  bool isReverse = false;
  bool isSearch = false;
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

  openDrawer()
  {
    scaffoldKey.currentState!.openDrawer();
  }

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
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,

        elevation: 0,
        leadingWidth: (MediaQuery.of(context).size.width),
        leading:
        PageTransitionSwitcher(
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
          child:isSearch == true ?
              Container(
                padding: SCREEN_PADDING,
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          isSearch = false;
                        });
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    hintText: "Search"
                  ),
                ),
              )
              : Column(
            children: [
              GAP,
              Container(
                padding: SCREEN_PADDING,
                width: (MediaQuery.of(context).size.width),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width)/2,
                      child: Row(
                        children: [

                          GestureDetector(
                            onTap: ()
                            {
                              openDrawer();
                            },
                            child: Icon(Icons.menu_rounded),
                          ),
                          Text("    "),
                          Text(titles[currentScreen]),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: ()
                          {
                            setState(() {
                              isSearch = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(6),
                            child: Icon(Icons.search,color: Colors.black54,),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ]
                            ),
                          ),
                        ),
                        Text(" "),
                        GestureDetector(
                          onTap: ()
                          {
                            setState(() {
                              isSearch = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(6),
                            child: Icon(Icons.notifications_none,color: Colors.black54,),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ]
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              GAP
            ],
          ),
        )

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
      drawer: Drawer(
        backgroundColor : Colors.white70,
        child: DrawerUser(),
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