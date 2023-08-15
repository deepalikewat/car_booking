import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Rough extends StatefulWidget {
  @override
  State<Rough> createState() => dxx();
}

//gg
// ignore: camel_case_types
class dxx extends State<Rough> {
  void dinc(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              color: Color.fromARGB(255, 31, 14, 184),
              child: Row(
                children: [Icon(Icons.dangerous)],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // double xwidth = MediaQuery.of(context).size.width;
    // double xheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: TextButton(
        onPressed: () {
          dinc(context);
        }, 
        style: TextButton.styleFrom(
            // backgroundColor: const Color.fromARGB(255, 68, 44, 44),
            foregroundColor: Colors.blueAccent),
        child: const Text("Done"),
      ),
    );
  }
}
