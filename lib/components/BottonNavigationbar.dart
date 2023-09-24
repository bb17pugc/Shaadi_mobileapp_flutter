
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/Colors.dart';

import '../utils/Constants.dart';
import '../utils/Language.dart';

class BottomNavigation extends StatefulWidget {

  final Function? onClickHome;
  final Function? onClickCart;
  final Function? onClickOrders;
  final Function? onClickCurrentOrders;
  final int? currentSelected;
  void onRefresh(int value)
  {
    _BottomNavigationState().setCurrentWidget(value);
  }

  BottomNavigation({
      this.onClickHome=null ,
      this.onClickCart=null ,
      this.onClickOrders=null ,
      this.onClickCurrentOrders=null ,
      this.currentSelected=null
});
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
{
  String imageURL = DOMAIN_URL+"images/services/item_service_placeholder.png";

  late  int currentSelected = 0;
  void setCurrentWidget(value)
  {
    // if(mounted)
    //   {
    //     setState(() {
    //       currentSelected = value;
    //     });
    //   }
    //   print("currentSelected:,${currentSelected}");
  }

  Widget build(BuildContext context)
  {
    return Container(

      width: (MediaQuery.of(context).size.width),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Column(
            children: [
              GestureDetector(
                onTap: ()
                {
                  setState(() {
                    currentSelected = 0;
                  });
                  widget.onClickHome!();
                },
                child:widget.currentSelected == 0 ?
                Icon(Icons.home,size: 27,color: PrimaryColor,)
                    : Icon(Icons.home_outlined,size: 27,color: Colors.grey,),
              ),
              Text(LANGUAGE[0]["home"]! , style: TextStyle(fontSize: 12,color: widget.currentSelected == 0?PrimaryColor : Colors.grey ),)
            ],
          ),

          Column(
            children: [
              GestureDetector(
                onTap: ()
                {
                  setState(() {
                    currentSelected = 1;
                  });
                  widget.onClickCart!();
                },
                child:widget.currentSelected == 1 ?
                Icon(Icons.sticky_note_2,size: 27,color: PrimaryColor,)
                    : Icon(Icons.shopping_cart_outlined,size: 27,color: Colors.grey,),
              ),
              Text(LANGUAGE[0]["my_bookings"]! , style: TextStyle(fontSize: 12,color: widget.currentSelected == 1?PrimaryColor : Colors.grey ))
            ],
          ),

          Column(
            children: [
              GestureDetector(
                onTap: ()
                {
                  setState(() {
                    currentSelected = 2;
                  });
                  widget.onClickOrders!();
                },
                child:widget.currentSelected == 2 ?
                Icon(Icons.shopping_bag,size: 27,color: PrimaryColor,)
                    : Icon(Icons.history_edu_rounded,size: 27,color: Colors.grey,),
              ),
              Text(LANGUAGE[0]["requests"]! , style: TextStyle(fontSize: 12,color: widget.currentSelected == 2?PrimaryColor : Colors.grey ))
            ],
          ) ,

          Column(
            children: [
              GestureDetector(
                onTap: ()
                {
                  setState(() {
                    currentSelected = 3;
                  });
                  widget.onClickCurrentOrders!();
                },
                child:widget.currentSelected == 3 ?
                Icon(Icons.people,size: 30,color: PrimaryColor,)
                    : Icon(Icons.delivery_dining_outlined,size: 30,color: Colors.grey,),
              ),
              Text(LANGUAGE[0]["chat"]! , style: TextStyle(fontSize: 12,color: widget.currentSelected == 3?PrimaryColor : Colors.grey ))
            ],
          )
        ],
      ),
    );
  }
}