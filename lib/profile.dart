import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => dix();
}

//gg
class dix extends State<Profile> {
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
      appBar: AppBar(
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(""),
              Text(
                "Edit Profile",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1B1E28)),
              ),
              Row(
                children: [
                  Text(
                    "Done",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0D6EFD)),
                  ),
                ],
              ),
            ]),
      ),
      body: Center(
          child: Column(children: [
        const Padding(padding: EdgeInsets.only(top: 50)),
        Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, border: Border.all()),
          height: 120,
          width: 122,
          child: const ClipOval(
              child: Image(
            image: AssetImage("img/QT.jpeg"),
            width: 100,
            height: 300,
            fit: BoxFit.cover,
          )),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        // const Padding(padding: EdgeInsets.only(top: 20, bottom: 10)),
        const Text(
          "Cutest",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Color(0xff1B1E28)),
        ),

        const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 50),
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
          padding: const EdgeInsets.only(bottom: 200),
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
