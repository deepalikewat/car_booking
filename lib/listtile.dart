import 'package:flutter/material.dart';

class Listt extends StatefulWidget {
  @override
  State<Listt> createState() => rxx();
}

class rxx extends State<Listt> {
  void dinc() {}

  @override
  Widget build(BuildContext context) {
    // double xwidth = MediaQuery.of(context).size.width;

    return const Scaffold(
      body:
         
          Column(children: [
        ListTile(
          leading: SizedBox(
            // height: 200,
            // width: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image(
                  image: AssetImage("img/QT.jpeg"),
                  // width: 100,
                  // height: 600,
                  fit: BoxFit.cover,
                )),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tata LPT 25211 Truck",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff898787)),
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
                        fontWeight: FontWeight.bold, color: Color(0xff898787)),
                  )
                ],
              )
            ],
          ),
          trailing: Column(
            children: [
              Text("PRICE",
                  style: TextStyle(
                      color: Color(0xff0D6EFD),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              Text("RS.8000",
                  style: TextStyle(
                      color: Color(0xff0D6EFD),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              Text("185.2 km",
                  style: TextStyle(
                      color: Color(0xff898787),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ]),
    );
  }
}
