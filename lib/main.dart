import 'package:car_booking/DriverDashboard.dart';
import 'package:car_booking/UploadDashboard.dart';
import 'package:car_booking/UserDasboard.dart';
import 'package:car_booking/booking.dart';
import 'package:car_booking/drftest.dart';
import 'package:car_booking/driver_profile.dart';
import 'package:car_booking/owner_profile.dart';
import 'package:car_booking/profile.dart';
import 'package:car_booking/rloginn.dart';
import 'package:car_booking/front.dart';
import 'package:car_booking/lorry.dart';
import 'package:car_booking/otp_verify.dart';
import 'package:car_booking/rough3.dart';
import 'package:car_booking/sign_in.dart';
import 'package:car_booking/upload.dart';
import 'package:car_booking/uploadx.dart';
import 'package:flutter/material.dart';
import 'map_with_autocomplete.dart';

void main() {
  runApp(const MainApp());
}
//uuc

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(

scaffoldBackgroundColor: const Color(0xfff8fbff)


        ),

        home:  Lorry());

        
    // 
  }
}
