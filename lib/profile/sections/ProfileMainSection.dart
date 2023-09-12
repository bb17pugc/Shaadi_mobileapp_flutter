import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileMainSection extends StatefulWidget {
  const ProfileMainSection({super.key});

  @override
  State<ProfileMainSection> createState() => _ProfileMainSectionState();
}

class _ProfileMainSectionState extends State<ProfileMainSection> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(

        )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}