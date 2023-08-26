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

    return  Scaffold(
      body: Center(
          child: Column(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                
                height: 120,
                width: 122,
                child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Image(
                      image: AssetImage("img/QT.jpeg"),
                      width: 100,
                      height: 300,
                      fit: BoxFit.cover,
                    )),
              ),
              const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tata LPT 25211 Truck",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff898787)),
                      ),
                      Text(
                        "Amit Das",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          Text(
                            "4.1(155)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff898787)),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              const Row(
                children: [
                  Column(
                    children: [
                      Text("PRICE",
                          style: TextStyle(
                              color: Color(0xff0D6EFD),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      Text("RS.8000",
                          style: TextStyle(
                              color: Color(0xff0D6EFD),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text("185.2 km",
                          style: TextStyle(
                              color: Color(0xff898787),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
