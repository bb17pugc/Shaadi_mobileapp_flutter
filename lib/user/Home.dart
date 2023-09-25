import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/ItemPerson.dart';
import 'package:mobile/components/filter.dart';
import 'package:mobile/utils/Constants.dart';

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

  getSelectedFilters(value)
  {

  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: 50,
              child: Filter(getHomeFilters(),getSelectedFilters),
            ),
            GAP,
            Container(
              height: MediaQuery.of(context).size.height-100,
              child: ListItems(),
            )
          ],
        ),
      ),
    );
  }
}