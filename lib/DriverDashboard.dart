import 'dart:ui';

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

    Future<void> sendloc() async {
      await Future.delayed(Duration(seconds: 2));

      setState(() {});
    }

    return Scaffold(
        key: _scaffoldKey,
        
        drawer: const Drawer(backgroundColor: Color(0xff0F6868)),
        body: Container(
          
          child: Stack(
            
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
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
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Color(0xfff1f5f3),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Image(
                                  image: AssetImage("img/dp.png"),
                                  width: 60,
                                  height: 60,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      "data",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "data",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 25,
                                      ),
                                    )
                                  ],
                                ),
                                const Expanded(child: Text("")),
                                FilledButton(
                                    onPressed: () {},
                                    style: const ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(
                                            Colors.white),
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: 25))),
                                    child: const Text(
                                      "☢ Refresh",
                                      style: TextStyle(
                                          color: Color(0xff44c951),
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Color(0x5f749b83),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: const Row(
                          children: [
                            // Text("data",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 16, fontWeight: FontWeight.bold),),
        
                            SizedBox(
                                width: 180,
                                child:
                                    MarqueeText(text: "Last Updated Location")),
                            Expanded(child: Text("")),
                            Text("10:00",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: xwidth,
                margin: EdgeInsets.only(top: xheight * .37,left: 10,right: 10),
                decoration: const BoxDecoration(
                    color: Color(0xfff1f5f3),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: const Column(
                  children: [Text("data")],
                ),
              )
            ],
          ),
        ));
  }
}

class MarqueeText extends StatefulWidget {
  final String text;

  const MarqueeText({super.key, required this.text});

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollText();
  }

  void _scrollText() async {
    // while (true) {
    //   await Future.delayed(const Duration(milliseconds: 100));
    //   if (_scrollController.position.maxScrollExtent > 0) {
    //     if (_scrollController.position.pixels ==
    //         _scrollController.position.maxScrollExtent) {
    //       _scrollController.jumpTo(0.0);
    //     } else {
    //       _scrollController.animateTo(
    //         _scrollController.position.pixels + 1.0,
    //         duration: const Duration(milliseconds: 100),
    //         curve: Curves.linear,
    //       );
    //     }
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Text(
        widget.text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
