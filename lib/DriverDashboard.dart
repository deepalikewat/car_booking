import 'dart:ui';

import 'package:flutter/material.dart';

class DriverDashBoard extends StatefulWidget {
  @override
  State<DriverDashBoard> createState() => DriverDashBoardx();
}

class DriverDashBoardx extends State<DriverDashBoard> {
  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        // ignore: prefer_const_constructors
        drawer: SafeArea(
          child: Drawer(
            // backgroundColor: Color(0xff0F6868),
            child: Column(
              children: [
                Row(
                  children: [
                    // Padding(padding: EdgeInsets.only(top: xheight * 0.2)),
                    SizedBox(
                      width: xwidth * .04,
                    ),
                    const ClipOval(
                        child: Image(
                      image: AssetImage("img/QT.jpeg"),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )),
                    Padding(padding: EdgeInsets.only(left: xwidth * 0.03)),

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Raju haldar",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Manager.fbrsystems@gmail.com",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  //
                  height: xheight * 0.03,
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 20),
                //   height: xheight * 0.06,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: const Color(0xffE7E7E7),
                //   ),
                //   child: Row(
                //     // crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SizedBox(
                //         width: xwidth * .01,
                //       ),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(8),
                //         child: Container(
                //           height: 35,
                //           width: 35,
                //           color: const Color(0xff116D6D),
                //           child: const Icon(
                //             Icons.add_card,
                //             size: 18,
                //           ),
                //         ),
                //       ),
                //       Padding(padding: EdgeInsets.only(left: xwidth * 0.05)),
                //       const Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             "Available Balance",
                //             style: TextStyle(
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.bold,
                //                 color: Color(0xff116D6D)),
                //           ),
                //           Text(
                //             "Manager.fbrsystems@gmail.com",
                //             style: TextStyle(
                //                 fontSize: 10, fontWeight: FontWeight.bold),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: xheight * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipOval(
                        child: Container(
                          height: 40,
                          width: 40,
                          color: const Color(0xffE7E7E7),
                          child: const Icon(
                            Icons.menu,
                            size: 15,
                            color: Color(0xff116D6D),
                          ),
                        ),
                      ),
                      const Text(
                        "My Orders",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                      SizedBox(
                        width: xwidth * 0.2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: xheight * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipOval(
                        child: Container(
                          height: 40,
                          width: 40,
                          color: const Color(0xffE7E7E7),
                          child: const Icon(
                            Icons.login,
                            size: 15,
                            color: Color(0xff116D6D),
                          ),
                        ),
                      ),
                      const Text(
                        "Refer & Earn",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                      SizedBox(
                        width: xwidth * 0.2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: xwidth * .03,
                  height: xheight * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: xwidth * .04,
                    ),
                    ClipOval(
                      child: Container(
                        height: 40,
                        width: 40,
                        color: const Color(0xffE7E7E7),
                        child: const Icon(
                          Icons.info,
                          size: 15,
                          color: Color(0xff116D6D),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: xwidth * 0.05)),
                    const Text(
                      "About Us",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                SizedBox(
                  height: xheight * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipOval(
                        child: Container(
                          height: 40,
                          width: 40,
                          color: const Color(0xffE7E7E7),
                          child: const Icon(
                            Icons.share,
                            size: 15,
                            color: Color(0xff116D6D),
                          ),
                        ),
                      ),
                      const Text(
                        "Share App",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                      SizedBox(
                        width: xwidth * 0.2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: xheight * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipOval(
                        child: Container(
                          height: 40,
                          width: 40,
                          color: const Color(0xffE7E7E7),
                          child: const Icon(
                            Icons.quiz,
                            size: 15,
                            color: Color(0xff116D6D),
                          ),
                        ),
                      ),
                      const Text(
                        "FAQ",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                      SizedBox(
                        width: xwidth * 0.2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: xheight * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipOval(
                        child: Container(
                          height: 40,
                          width: 40,
                          color: const Color(0xffE7E7E7),
                          child: const Icon(
                            Icons.textsms,
                            size: 15,
                            color: Color(0xff116D6D),
                          ),
                        ),
                      ),
                      const Text(
                        "Terms & Conditions",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                      SizedBox(
                        width: xwidth * 0.2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: xwidth * .03,
                  height: xheight * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipOval(
                        child: Container(
                          height: 40,
                          width: 40,
                          color: const Color(0xffE7E7E7),
                          child: const Icon(
                            Icons.description,
                            size: 15,
                            color: Color(0xff116D6D),
                          ),
                        ),
                      ),
                      const Text(
                        "Privacy policy",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                      SizedBox(
                        width: xwidth * 0.2,
                      ),
                    ],
                  ),
                ),
                const Expanded(child: Text("")),
                Row(
                  children: [
                    SizedBox(
                      width: xwidth * .04,
                    ),
                    const ClipOval(
                      child: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: xwidth * 0.05)),
                    const Text(
                      "Log Out",
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: xheight * .45,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff1B7D7D), Color(0xff828448)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Return Lorry",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          icon: const Icon(
                            Icons.circle_notifications,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: xwidth,
              margin: EdgeInsets.only(top: xheight * .3),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 132, 17, 17),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: const Column(
                children: [Text("data")],
              ),
            )
          ],
        ));
  }
}
