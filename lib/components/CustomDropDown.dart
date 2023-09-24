import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomButton.dart';
import 'package:mobile/utils/Colors.dart';


import '../utils/Constants.dart';

class CustomDropDown extends StatefulWidget {


  final String? Label;
  final Function? getInput,Close;
  final dynamic? reduceWidth,listItems,itemDDL,borderRadius,width,backgroundColor,opacity,currentSelectedID;
  CustomDropDown({super.key,this.reduceWidth=200,this.currentSelectedID=0,this.Close ,this.borderRadius=20,this.opacity=0.5,this.width=20,this.backgroundColor=Colors.white,this.itemDDL = ddlText,required this.listItems,this.getInput=null,this.Label=""});
  @override
  State<CustomDropDown> createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CustomDropDown> {

  int currentIntIndex = 0;
  setCurrentIndex(i)
  {

      setState(() {
        currentIntIndex = i;
      });
      widget.getInput!(i);
      print("current selected index");
      print(currentIntIndex);

  }
  @override
  Widget build(BuildContext context) {
    return // Note: Same code is applied for the TextFormField as well
      Column(

        children: [
          GAP,
          Container(
            padding: EdgeInsets.all(20),
            child: Text(widget.Label!,style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
          ),
          Container(
            height:(MediaQuery.of(context).size.height-widget.reduceWidth),
            child: ListView.builder(
              scrollDirection:Axis.vertical,
              itemCount: widget.listItems.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: ()
                  {
                    setCurrentIndex(i);
                  },
                  child: Container(
                    width: double.parse(widget.width.toString()),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: widget.backgroundColor,
                        border: Border.all(
                          color:(widget.currentSelectedID == 0 ? currentIntIndex : widget.currentSelectedID) == widget.listItems[i].id ? PrimaryColor : widget.backgroundColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(double.parse(widget.borderRadius.toString()!) )),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(widget.opacity!),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ]
                    ),
                    child: Row(
                      children: [
                        GAP,
                        (widget.currentSelectedID == 0 ? currentIntIndex : widget.currentSelectedID) == widget.listItems[i].id ? Icon(Icons.check_circle,color: PrimaryColor,) :  Icon(Icons.check_circle_outline),
                        Text("  "),
                        Container(
                          width: MediaQuery.of(context).size.width-100,
                          child: widget.itemDDL(widget.listItems[i]),
                        ),
                        GAP,
                      ],
                    ),


                  ),
                );
              },
            ),
          ),

          CustomButton(onPressed: widget.Close,Label: "Select",backgroundColor: PrimaryColor,)
        ],
      );
  }
}