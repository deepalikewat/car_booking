import 'package:car_booking/profile.dart';
import 'package:car_booking/sign_in.dart';
import 'package:car_booking/front.dart';
import 'package:car_booking/lorry.dart';
import 'package:car_booking/otp_verify.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Profile());
  }
  //add data
  //wertyu
}
