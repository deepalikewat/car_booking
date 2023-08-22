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
              height: xheight *.5,
            ),
             Padding(padding: EdgeInsets.only(top: xheight*.02)),
            const Text(
              "Are You a Passenger",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xff000000)),
            ),
            const Text(
              "or a Driver",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xff000000)),
            ),
             Padding(padding: EdgeInsets.only(top:  xheight*.02)),
            const Text(
              "You can change the mode",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff7D848D)),
            ),


const Expanded(child: Text("")),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              width: xwidth,
              child: ElevatedButton(
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                           
                           return Profile();
                           

                         },));
                },
                child: const Text("Passenger", style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0D6EFD),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              width: xwidth,
              child: ElevatedButton(
                onPressed: () {


                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                           
                           return const Driver();
                           

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
