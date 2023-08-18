import 'package:car_booking/rloginn.dart';
import 'package:flutter/material.dart';

class Lorry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const RLogin()));
    });
    return Scaffold(
      backgroundColor: const Color(0xff0D6EFD),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(30),
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
