import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => dix();
}

//gg
class dix extends State<Profile> {
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

  TextEditingController p_name = TextEditingController();
  TextEditingController p_num = TextEditingController();
  TextEditingController p_emailid = TextEditingController();
  TextEditingController p_addr = TextEditingController();

  // void dinc() {}
  Future<void> drf_profile() async {
    final datax = json.encode({
      "driver_name": p_name.text,
      "driver_phone": p_num.text,
      "driver_email": p_emailid.text,
      "driver_address": p_addr.text,
    });

    print(datax);
  }

  void dinc() {}

  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
          child: Column(children: [
        SizedBox(
          height: xheight * .01,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     const Text(""),
        //     const Text("Edit Profile",
        //         style: TextStyle(
        //             color: Color(0xff000000),
        //             fontSize: 28,
        //             fontWeight: FontWeight.bold)),
        //     TextButton(
        //       onPressed: () {},
        //       style: TextButton.styleFrom(
        //           // backgroundColor: const Color.fromARGB(255, 68, 44, 44),
        //           foregroundColor: Colors.blueAccent),
        //       child: const Text("Done"),
        //     ),
        //   ],
        // ),

        Padding(padding: EdgeInsets.only(top: xheight * 0.01)),

        Container(
          height: 130,
          width: 130,
          child: Stack(children: [
            ClipOval(
                child: _image == null
                    ? const Image(
                        image: AssetImage("img/QT.jpeg"),
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        _image!,
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      )),
            Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    getImage();
                  },
                ))
          ]),
        ),
        SizedBox(
          height: xheight * .01,
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        // const Padding(padding: EdgeInsets.only(top: 20, bottom: 10)),
        const Text(
          "ABC XYZ",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xff1B1E28)),
        ),

        const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 10),
          child: Text(
            "Change Profile Picture",
            style: TextStyle(fontSize: 16, color: Color(0xff0D6EFD)),
          ),
        ),

        Container(
          padding: const EdgeInsets.only(bottom: 8),
          width: xwidth - 70,
          child: const Text(
            "Full Name",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),

        Container(
          width: xwidth - 60,
          child: TextField(
            controller: p_name,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "Cutest",
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.only(bottom: 8, top: 20),
          width: xwidth - 70,
          child: const Text(
            "Enter Number",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),

        Container(
          width: xwidth - 60,
          child: TextField(
            controller: p_num,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "+91",
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.only(bottom: 8, top: 20),
          width: xwidth - 70,
          child: const Text(
            "Email Id",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),

        Container(
          width: xwidth - 60,
          child: TextField(
            controller: p_emailid,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "Driver@gmial.com",
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.only(bottom: 8, top: 20),
          width: xwidth - 70,
          child: const Text(
            "Enter Address",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),

        Container(
          width: xwidth - 60,
          child: TextField(
            controller: p_addr,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "Enter Full Address",
            ),
          ),
        ),
        const Expanded(child: Text("")),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 60,
          width: xwidth,
          child: ElevatedButton(
            onPressed: () {
              drf_profile();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0D6EFD),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            child: const Text(
              "Update",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ])),
    );
  }
}
