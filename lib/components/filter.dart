
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/utils/Colors.dart';
import 'package:mobile/utils/Constants.dart';


class Filter extends StatefulWidget {

  List<String> optionFilters;
  Function getSelectedFilters;
  Filter(this.optionFilters , this.getSelectedFilters);
  @override
  State<Filter> createState() => FilterState();
}

class FilterState extends State<Filter>
{
  List<dynamic> selecteFilters = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.all(6),
      margin: SCREEN_PADDING,
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
        child: ListView.builder(
            primary: false,
            itemCount: widget.optionFilters.length,
            scrollDirection: Axis.horizontal ,
            itemBuilder: (BuildContext context, int index) {
              return
                GestureDetector(
                  onTap: (){
                      print("widget.optionFilters , ${widget.optionFilters}");
                      addSelectedFilter(widget.optionFilters[index]);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      children: [
                        selecteFilters.contains(widget.optionFilters[index]) ? Icon(Icons.check_box,color: PrimaryColor,)  : Icon(Icons.check_box_outline_blank,weight:50.0 ,color: Colors.black54,),
                        Text(widget.optionFilters[index],style: TextStyle(color:selecteFilters.contains(widget.optionFilters[index]) ? PrimaryColor : Colors.black54),)
                      ],
                    ),
                  ),
                );
            }),
    );
  }

  void addSelectedFilter(dynamic? dictAppStatus) {
      setState(() {

        if(selecteFilters.contains(dictAppStatus))
          {
            selecteFilters.remove(dictAppStatus);
          }
        else
          {
            selecteFilters.add(dictAppStatus!);
          }
      });
      widget.getSelectedFilters(selecteFilters);
  }
}