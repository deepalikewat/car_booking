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
  File? _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    print(pickedFile?.path);
    // File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  void dinc(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
                  height: 300,
                  width: 400,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  // decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(90)),
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
                      Padding(padding: EdgeInsets.only(top: 50)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  dinc(context);

                                  getImage();
                                },
                                icon: const Icon(
                                  Icons.add_card,
                                  size: 70,
                                ),
                                label: const Text(""),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16))),
                              ),
                              Padding(padding: EdgeInsets.only(top: 50)),
                              const Text(
                                "Front",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  dinc(context);

                                  getImage();
                                },
                                icon: const Icon(
                                  Icons.add_card,
                                  size: 70,
                                ),
                                label: const Text(""),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16))),
                              ),
                              Padding(padding: EdgeInsets.only(top: 50)),
                              const Text(
                                "Back",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Expanded(child: Text("")),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        width: 500,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0D6EFD),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          child: const Text(
                            "Submit ",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ))));
        });
  }

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
          height: xheight * .09,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                // const Color(0xffF3F6FF),
                ElevatedButton.icon(
                  onPressed: () {
                    dinc(context);
                  },
                  icon: const Icon(
                    Icons.add_card,
                    size: 50,
                    color: Colors.black,
                  ),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF3F6FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
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
                ElevatedButton.icon(
                  onPressed: () {
                    dinc(context);
                  },
                  icon: const Icon(
                    Icons.add_card,
                    size: 50,
                    color: Colors.black,
                  ),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF3F6FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
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
                ElevatedButton.icon(
                  onPressed: () {
                    dinc(context);
                  },
                  icon: const Icon(
                    Icons.add_card,
                    size: 50,
                    color: Colors.black,
                  ),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF3F6FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
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
                ElevatedButton.icon(
                  onPressed: () {
                    dinc(context);
                  },
                  icon: const Icon(
                    Icons.add_card,
                    size: 50,
                    color: Colors.black,
                  ),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF3F6FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
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
                ElevatedButton.icon(
                  onPressed: () {
                    dinc(context);
                  },
                  icon: const Icon(
                    Icons.add_card,
                    size: 50,
                    color: Colors.black,
                  ),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF3F6FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: xheight * .02,
                ),
                const Text(
                  "Vehicle",
                  style: TextStyle(fontSize: 15),
                ),
                const Text(
                  "Insurance ",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    dinc(context);
                  },
                  icon: const Icon(
                    Icons.add_card,
                    size: 50,
                    color: Colors.black,
                  ),
                  label: const Text(""),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF3F6FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
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
