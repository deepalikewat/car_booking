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

    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      size: 38,
                      color: Color.fromARGB(255, 10, 9, 9),
                    ),
                    Text("Booking",
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                    Text("Cancel",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 20,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, border: Border.all()),
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
                    Row(
                      children: [
                        Column(
                          children: [Text("Tata LPT 25211 Truck")],
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
