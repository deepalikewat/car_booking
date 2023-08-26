import 'dart:io';

import 'package:car_booking/owner_profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Driver extends StatefulWidget {
  const Driver();
  @override
  State<Driver> createState() => ri();
}

class ri extends State<Driver> {
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

  TextEditingController d_name = TextEditingController();
  TextEditingController d_num = TextEditingController();
  TextEditingController d_emailid = TextEditingController();
  TextEditingController d_addr = TextEditingController();
  TextEditingController d_adhar = TextEditingController();
  TextEditingController d_license = TextEditingController();
  // void dinc() {}
  Future<void> drf_driver() async {
    final datax = json.encode({
      "driver_name": d_name.text,
      "driver_phone": d_num.text,
      "driver_email": d_emailid.text,
      "driver_address": d_addr.text,
      "driver_aadhar_no": d_adhar.text,
      "driver_driving_license_no": d_license.text,
    });
    print(datax);
  }

  void dinc() {}

  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Center(
              child: Column(children: [
        SizedBox(
          height: xheight * .01,
        ),
        const Text(
          "Driver Profile",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xff1B1E28)),
        ),
        Padding(padding: EdgeInsets.only(top: xheight * 0.03)),
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
        const Padding(padding: EdgeInsets.only(top: 20)),
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          width: xwidth - 70,
          child: const Text(
            "Full  Name",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),
        Container(
          width: xwidth - 60,
          child: TextField(
            controller: d_name,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "name",
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
            controller: d_num,
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
            controller: d_emailid,
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
            "Full Address",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          width: xwidth - 60,
          child: TextField(
            controller: d_addr,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "Enter Full Address",
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            bottom: 8,
          ),
          width: xwidth - 70,
          child: const Text(
            "Aadhar Card Number",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          width: xwidth - 60,
          child: TextField(
            controller: d_adhar,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "000 000 000 000 00",
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            bottom: 8,
          ),
          width: xwidth - 70,
          child: const Text(
            "Driving License Number",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),
        Container(
          width: xwidth - 60,
          child: TextField(
            controller: d_license,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "00000 0000",
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: 60,
          width: xwidth,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Owner();
                },
              ));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0D6EFD),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            child: const Text(
              "Next",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ]))),
    ));
  }
}
