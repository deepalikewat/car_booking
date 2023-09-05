import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  @override
  State<Booking> createState() => dxx();
}

class dxx extends State<Booking> {
  void dinc() {}

  @override
  Widget build(BuildContext context) {
    // double xwidth = MediaQuery.of(context).size.width;

    return const Scaffold(
        body: Center(
            child: Column(children: [
      SizedBox(
        height: 300,
      ),
      SizedBox(
        height: 80,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image(
              image: AssetImage("img/QT.jpeg"),
              width: 100,
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tata LPT 25211 Truck", style: TextStyle(fontSize: 20)),
                Text(
                  "Raju Haldar",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "★ 4.1 (100)",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price", style: TextStyle(fontSize: 20)),
                Text(
                  "Raju Haldar",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "★ 4.1 (100)",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ],
        ),
      )
    ])));
  }
}
