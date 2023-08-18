import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Uploadx extends StatefulWidget {
  @override
  State<Uploadx> createState() => du();
}

//gg
class du extends State<Uploadx> {
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
              color: Color.fromARGB(255, 67, 67, 99),
              child: const Row(
                children: [Icon(Icons.dangerous)],
              ),
            ),
          );
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
          height: xheight * .1,
        ),
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
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(
                  height: xheight * .02,
                ),
                const Text(
                  "Front",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(
                  height: xheight * .02,
                ),
                const Text(
                  "Back",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: xheight * .06,
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
  }
}
