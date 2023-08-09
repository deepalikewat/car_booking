import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => dix();
}
//gg
class dix extends State<Profile> {
  void dinc() {}

  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
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
                padding: EdgeInsets.only(bottom: 8),
                width: xwidth - 70,
                child: const Text(
                  "First Name",
                  style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
                ),
              ),

              Container(
                width: xwidth - 60,
                child: const TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: "Cutest",
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 8, top: 20),
                width: xwidth - 70,
                child: const Text(
                  "Enter Number",
                  style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
                ),
              ),

              Container(
                width: xwidth - 60,
                child: const TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: "+91",
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 8, top: 20),
                width: xwidth - 70,
                child: const Text(
                  "Email Id",
                  style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
                ),
              ),

              Container(
                width: xwidth - 60,
                child: const TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: "Driver@gmial.com",
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 8, top: 20),
                width: xwidth - 70,
                child: const Text(
                  "Enter Address",
                  style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 200),
                width: xwidth - 60,
                child: const TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: "Enter Full Address",
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                width: xwidth,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0D6EFD),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  child: Text(
                    "Update",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
