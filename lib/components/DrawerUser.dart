import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/Constants.dart';

import 'package:page_transition/page_transition.dart';

class DrawerUser extends StatefulWidget {
  const DrawerUser({super.key});
  @override
  State<DrawerUser> createState() => DrawerUserState();
}

class DrawerUserState extends State<DrawerUser> {

  openAccounts()
  {
    // Navigator.push(context, PageTransition(duration: Duration(milliseconds: 500),type: PageTransitionType.rightToLeft, child: ShopKeeperAccounts()));
  }
  openCategories()
  {
    // Navigator.push(context, PageTransition(duration: Duration(milliseconds: 500),type: PageTransitionType.rightToLeft, child: ShopKeeperAddProduct()));
  }

  openGroups()
  {
    // Navigator.push(context, PageTransition(duration: Duration(milliseconds: 500),type: PageTransitionType.rightToLeft, child: ShopKeeperAddProduct()));
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          color: Colors.white,
          child: ListTile(
            contentPadding: EdgeInsets.all(30),
            subtitle:Container(
              height: 50,
              child: Text("address",style: TextStyle(overflow: TextOverflow.fade),),
            ) ,
            title: Text("username"),
            leading: Container(
              width: 80,
              height: 80,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(PLACEHOLDER_IMAGE,),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text("Subscription"),
          leading: Icon(Icons.account_circle_outlined),
          onTap: ()
          {
            openAccounts();
          },

        ),
        ListTile(
          title: Text("Agents"),
          leading: Icon(Icons.real_estate_agent_outlined),
          onTap: ()
          {
            openCategories();
          },
        ),
        ListTile(
          title: Text("Success Stories"),
          leading: Icon(Icons.amp_stories_outlined),
        ),
        ListTile(
          title: Text("Customer Feeback"),
          leading: Icon(Icons.feedback_outlined),
        ),
        ListTile(
          title: Text("Blogs"),
          leading: Icon(Icons.content_paste),
        ),
        ListTile(
          title: Text("Logout"),
          leading: Icon(Icons.contact_mail_outlined),
        ),
      ],
    );
  }
}