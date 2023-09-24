import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/ItemPerson.dart';

import '../utils/Colors.dart';

class Home extends StatefulWidget {

  Home({super.key});
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {



  Widget ListItems()
  {
    return GridView.count(
        key: new Key(DateTime.now().toString()),
        crossAxisCount: 2,
        children: List.generate(10,(i){
          return ItemPerson();
        })

    );
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListItems(),
    );
  }
}