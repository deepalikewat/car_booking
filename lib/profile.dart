import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => dix();
}

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
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 100)),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          // color: Colors.black,
                          // width: 3,
                          )),
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
                  width: xwidth - 70,
                  child: const Text(
                    "First Name",
                    style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0x87878799)),
                      borderRadius: BorderRadius.circular(10)),
                  width: xwidth - 80,
                  child: const TextField(
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      hintText: "Cutest",
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 10),
                    child: Container(
                      width: xwidth - 70,
                      child: const Text(
                        "Enter Number",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
                      ),
                    )),

                Row(
                  children: [
                    const Text(
                      "  +91",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 30)),
                    // Container(
                    //   height: 45,
                    //   width: 1,
                    //   color: Color(0x87878799),
                    // ),
                    Container(
                      width: xwidth - 130,
                      height: 60,
                      child: const TextField(
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          hintText: "Your number",
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: const Color(0x87878799)),
                    //       borderRadius: BorderRadius.circular(10)),
                    //   width: xwidth - 80,
                    //   child: const TextField(
                    //     style: TextStyle(fontSize: 16),
                    //     decoration: InputDecoration(
                    //       hintText: "Cutest",
                    //     ),
                    //   ),
                    // ),
                    //
                    Container(
                        //   width: xwidth - 70,
                        //   child: const Text(
                        //     "First Name",
                        //     style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
                        //   ),
                        // ),

                        // Container(
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: const Color(0x+
                        // 7878799)),
                        //       borderRadius: BorderRadius.circular(10)),
                        //   width: xwidth - 80,
                        //   child: const TextField(
                        //     style: TextStyle(fontSize: 16),
                        //     decoration: InputDecoration(
                        //       hintText: "Cutest",
                        //     ),
                        //   ),
                        // ),

                        )
                  ],
                ),
              ],
            ),
          ]),
        ));
  }
}
