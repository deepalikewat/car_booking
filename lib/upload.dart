import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  @override
  State<Upload> createState() => dux();
}

//gg
class dux extends State<Upload> {
  void dinc() {}

  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Center(
            child: Column(
      children: [
        SizedBox(
          height: xheight * .02,
        ),
        const Text(
          "Upload Documents",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xff1B1E28)),
        ),
        Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, border: Border.all()),
              height: 120,
              width: 122,
              child: const ClipRRect(
                  // borderRadius: BorderRadius.all(Radius.circular(30)),
                  child:
                      // Image(
                      //   image: AssetImage("img/QT.jpeg"),
                      //   width: 100,
                      //   height: 300,
                      //   fit: BoxFit.cover,
                      // )
                      Icon(Icons.file_copy)),
            ),
          ],
        )
      ],
    )));
  }
}
