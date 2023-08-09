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
        child: Row(
          children: [
            Column(
              children: [
                Row(
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
