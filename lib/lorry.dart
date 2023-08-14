import 'package:car_booking/driver_profile.dart';
import 'package:car_booking/profile.dart';
import 'package:car_booking/rough.dart';
import 'package:flutter/material.dart';

class L_4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double xheight = MediaQuery.of(context).size.height;
    double xwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(children: [
          // Padding(padding: EdgeInsets.only()),
          Column(children: [
            Image(
              image: const AssetImage("img/truck.png"),
              fit: BoxFit.fill,
              width: xwidth,
              height: xheight / 2.5,
            ),
            const Padding(padding: EdgeInsets.only(top: 70)),
            const Text(
              "Are you a Passenger",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xff000000)),
            ),
            const Text(
              "or a Driver",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xff000000)),
            ),
            const Padding(padding: EdgeInsets.only(top: 50)),
            const Text(
              "You can change the mode",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff7D848D)),
            ),
            const Padding(padding: EdgeInsets.only(top: 60)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              width: xwidth,
              child: ElevatedButton(
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                           
                           return Profile();
                           

                         },));
                },
                child: Text("Passenger", style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0D6EFD),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              width: xwidth,
              child: ElevatedButton(
                onPressed: () {


                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                           
                           return Driver();
                           

                         },));
                },
                child: const Text("Driver", style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0D6EFD),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
