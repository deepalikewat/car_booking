import 'package:car_booking/rough.dart';
import 'package:flutter/material.dart';

class Lorry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Rough()));
    });
    return Scaffold(
      backgroundColor: Color(0xff0D6EFD),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(30),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            height: 170,
            width: 170,
            child: const Image(
              image: AssetImage("img/logo.png"),
              fit: BoxFit.scaleDown,
            )),
      ),
    );
  }
}
