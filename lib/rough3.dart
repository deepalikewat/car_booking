import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Rough3 extends StatefulWidget {
  @override
  State<Rough3> createState() => dxsx();
}

//gg
// ignore: camel_case_types
class dxsx extends State<Rough3> {
  void dinc(BuildContext context) {}
  final xlist = <Widget>[
    Icon(Icons.menu),
    Icon(Icons.abc),
    Icon(Icons.ac_unit)
  ];
  @override
  Widget build(BuildContext context) {
    // double xwidth = MediaQuery.of(context).size.width;
    // double xheight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Center(
      child: ListView.builder(
        itemCount: xlist.length,
        itemBuilder: (BuildContext context, index) {
          return xlist[index];
        },
      ),
    ));
  }
}
