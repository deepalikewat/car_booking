import 'package:car_booking/DriverDashboard.dart';
import 'package:car_booking/UserDasboard.dart';
import 'package:car_booking/rloginn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Lorry extends StatefulWidget {
  @override

    State<Lorry> createState() => Lorryx();

}

class Lorryx  extends State<Lorry>{

Future<void> checkUserType() async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

   Future.delayed(const Duration(seconds: 3), () {
    if (prefs.getString("userType")=="1"){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  UserDashBoard()));

    }else if(prefs.getString("userType")=="2"){

            Navigator.push(context, MaterialPageRoute(builder: (context) =>  DriverDashBoard()));

    }
    else{

            Navigator.push(context, MaterialPageRoute(builder: (context) => const RLogin()));

    }


    });
}

  @override
  void initState() {
    super.initState();
    checkUserType();

  }
  @override
  Widget build(BuildContext context) {
   
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

