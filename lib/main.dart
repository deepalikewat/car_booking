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
import 'package:car_booking/rough.dart';
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
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xfff8fbff)),
        home: BookingListScreen());

    //
  }
}

class BookingListScreen extends StatefulWidget {
  @override
  _BookingListScreenState createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  List<Map<String, dynamic>> bookingData = [
    {
      "request_booking_id": 1,
      "booking_user": {
        "id": 1,
        "name": "Raju",
        "dp": "https://dcac.du.ac.in/assets/img/item.jpg"
      },
      "pick_up_point": {
        "lat": "24.185764",
        "long": "87.791982",
        "pincode": "713148",
        "address": "sdfsdf,sdf,sd,fdsf,d,f"
      },
      "destination_point": {
        "lat": "22.568660563718094",
        "long": "88.51089299422036",
        "pincode": "713148",
        "address": "sds,dfsdf,fdsdf"
      },
      "vehicle_type_id": 1,
      "material_weight": 2000,
      "material_type": "Plastic",
      "distance": 250,
      "calculated_price": 299,
      "booking_date": "2023-05-20 12:31:57",
      "request_status": {"status_code": "0", "status": "Open"}
    },
    {
      "request_booking_id": 1,
      "booking_user": {
        "id": 1,
        "name": "Raju",
        "dp": "https://dcac.du.ac.in/assets/img/item.jpg"
      },
      "pick_up_point": {
        "lat": "24.185764",
        "long": "87.791982",
        "pincode": "713148",
        "address": "sdfsdf,sdf,sd,fdsf,d,f"
      },
      "destination_point": {
        "lat": "22.568660563718094",
        "long": "88.51089299422036",
        "pincode": "713148",
        "address": "sds,dfsdf,fdsdf"
      },
      "vehicle_type_id": 1,
      "material_weight": 2000,
      "material_type": "Plastic",
      "distance": 250,
      "calculated_price": 25000,
      "booking_date": "2023-05-20 12:31:57",
      "request_status": {"status_code": "0", "status": "Open"}
    },
    // Add more test data as needed
  ];

  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();

    _isExpandedList = List.generate(bookingData.length, (index) => false);
  }

  void rtvv() {

    Map<String, dynamic> ryo={
      "request_booking_id": 1,
      "booking_user": {
        "id": 1,
        "name": "Raju",
        "dp": "https://dcac.du.ac.in/assets/img/item.jpg"
      },
      "pick_up_point": {
        "lat": "24.185764",
        "long": "87.791982",
        "pincode": "713148",
        "address": "sdfsdf,sdf,sd,fdsf,d,f"
      },
      "destination_point": {
        "lat": "22.568660563718094",
        "long": "88.51089299422036",
        "pincode": "713148",
        "address": "sds,dfsdf,fdsdf"
      },
      "vehicle_type_id": 1,
      "material_weight": 2000,
      "material_type": "Plastic",
      "distance": 250,
      "calculated_price": 25000,
      "booking_date": "2023-05-20 12:31:57",
      "request_status": {"status_code": "0", "status": "Open"}
    };
    
    bookingData.add(ryo);
  }

final TextEditingController _textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: DriverDashBoard(),
    );}}
   