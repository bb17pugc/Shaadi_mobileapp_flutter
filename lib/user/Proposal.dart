import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/CustomItemProposal.dart';
import 'package:mobile/components/filter.dart';
import 'package:mobile/utils/Constants.dart';

import '../utils/Colors.dart';

class Proposal extends StatefulWidget {

  Proposal({super.key});
  @override
  State<Proposal> createState() => ProposalState();
}

class ProposalState extends State<Proposal> {

  getSelectedFilters(value)
  {

  }
  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            child: Filter(getProposalFilters(),getSelectedFilters),
          ),
          Container(
            height: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height/4,
            child: ListView.builder(
              scrollDirection:Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: (){

                  },
                  child: CustomItemProduct(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}