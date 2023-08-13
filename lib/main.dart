import 'package:car_booking/booking.dart';
import 'package:car_booking/driver_profile.dart';
import 'package:car_booking/owner_profile.dart';
import 'package:car_booking/profile.dart';
import 'package:car_booking/rloginn.dart';
import 'package:car_booking/front.dart';
import 'package:car_booking/lorry.dart';
import 'package:car_booking/otp_verify.dart';
import 'package:car_booking/upload.dart';
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
<<<<<<< HEAD
    return  MaterialApp(home: Owner());
=======
    return MaterialApp(home: RLogin());
>>>>>>> 26e3416bc5012314266bef721d64554c3a60964a
  }
}
