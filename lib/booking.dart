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
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: EdgeInsets.all(20),
              child:
              Icon(
                Icons.menu,
                
                size: 30,
                color: Color.fromARGB(255, 10, 9, 9),
              )
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

          Padding(padding: EdgeInsets.symmetric(horizontal: 20),child:
          Row(
            verticalDirection: VerticalDirection.down,
            children: [
            ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Image(
                      image: AssetImage("img/QT.jpeg"),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
              ),
            
           
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
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
                ,
              
            
                  Column(
                    children: [
                      Text("PRICE",
                          style: TextStyle(
                              color: Color(0xff0D6EFD),
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                      Text("RS.8000",
                          style: TextStyle(
                              color: Color(0xff0D6EFD),
                              fontSize: 10,
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
          )
        ],
      )),
    );
  }
}
