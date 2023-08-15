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
        body: SafeArea(
            child: Center(
                child: Column(
      children: [
        const Text(
          "Upload Documents",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xff1B1E28)),
        ),
        SizedBox(
          height: xheight * .05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  height: xheight * .1,
                  width: xwidth * .30,
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F6FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.add_card,
                    size: 50,
                  )),
                ),
                SizedBox(
                  height: xheight * .02,
                ),
                const Text(
                  "Driver",
                  style: TextStyle(fontSize: 15),
                ),
                const Text(
                  "Adhar Card",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: xheight * .1,
                  width: xwidth * .30,
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F6FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.add_card,
                    size: 50,
                  )),
                ),
                SizedBox(
                  height: xheight * .02,
                ),
                const Text(
                  "Driving",
                  style: TextStyle(fontSize: 15),
                ),
                const Text(
                  "License",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: xheight * .1,
                  width: xwidth * .30,
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F6FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.add_card,
                    size: 50,
                  )),
                ),
                SizedBox(
                  height: xheight * .02,
                ),
                const Text(
                  "Owner",
                  style: TextStyle(fontSize: 15),
                ),
                const Text(
                  "Adhar Card",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: xheight * .06,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  height: xheight * .1,
                  width: xwidth * .30,
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F6FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.add_card,
                    size: 50,
                  )),
                ),
                SizedBox(
                  height: xheight * .02,
                ),
                const Text(
                  "Vehicle",
                  style: TextStyle(fontSize: 15),
                ),
                const Text(
                  "Photo ",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: xheight * .1,
                  width: xwidth * .30,
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F6FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.add_card,
                    size: 50,
                  )),
                ),
                SizedBox(
                  height: xheight * .02,
                ),
                const Text(
                  "Vehicle",
                  style: TextStyle(fontSize: 15),
                ),
                const Text(
                  "Vehicle Insurance ",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: xheight * .1,
                  width: xwidth * .30,
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F6FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.add_card,
                    size: 50,
                  )),
                ),
                SizedBox(
                  height: xheight * .02,
                ),
                const Text(
                  "Permit Parts",
                  style: TextStyle(fontSize: 15),
                ),
                const Text(
                  " Photo",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        const Expanded(child: Text("")),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 60,
          width: xwidth,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0D6EFD),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            child: const Text(
              "Upload",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ))));
  }
}
