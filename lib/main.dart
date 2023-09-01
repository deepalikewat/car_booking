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
    
//       body: SingleChildScrollView(
//         child: Container(


//           padding: const EdgeInsets.all(8.0),
//           child: ExpansionPanelList(
//             expandIconColor: Colors.transparent,
//             elevation: 1,
//             expandedHeaderPadding: const EdgeInsets.all(0),
//             expansionCallback: (int panelIndex, bool isExpanded) {
//               setState(() {

//                     _isExpandedList = List.generate(bookingData.length, (index) => false);
//                                     _isExpandedList[panelIndex] = !isExpanded;
//                                     _textEditingController.text="${bookingData.elementAt(panelIndex)['calculated_price']}";


//               });
//             },
//             children: bookingData.asMap().entries.map((entry) {
//               final int index = entry.key;
//               final Map<String, dynamic> booking = entry.value;

//               return ExpansionPanel(
//                 canTapOnHeader: true,
//                 headerBuilder: (BuildContext context, bool isExpanded) {
//                   return ListTile(
//                     leading: CircleAvatar(
//                       backgroundImage:
//                           NetworkImage(booking['booking_user']['dp']),
//                     ),
//                     title: Text(booking['booking_user']['name']),
//                     subtitle: Text(booking['material_type']),
//                     trailing: FilledButton(
//                         onPressed: () {},
//                         style: const ButtonStyle(
//                             backgroundColor:
//                                 MaterialStatePropertyAll(Color(0x401D8989))),
//                         child: Text(
//                           '${booking['distance']} km',
//                           style: const TextStyle(
//                               color: Color(0xff0F6868),
//                               fontWeight: FontWeight.bold),
//                         )),
//                   );
//                 },
//                 body: Column(children: [
//                   const Divider(),
//                   ListTile(
//                     leading: Ink(
//                         decoration: const ShapeDecoration(
//                             shape: CircleBorder(), color: Color(0xff0F6868)),
//                         child: const SizedBox(
//                           width: 35,
//                           height: 35,
//                           child:
//                               Icon(Icons.home, size: 20, color: Colors.white),
//                         )),
//                     title: Text("${booking['destination_point']['address']}"),
//                   ),
//                   ListTile(
//                     leading: Ink(
//                         decoration: const ShapeDecoration(
//                             shape: CircleBorder(), color: Color(0xff0F6868)),
//                         child: const SizedBox(
//                           width: 35,
//                           height: 35,
//                           child: Icon(Icons.location_city,
//                               size: 20, color: Colors.white),
//                         )),
//                     title: Text(
//                         'Pickup Point: ${booking['pick_up_point']['address']}'),
//                   ),

//                   ListTile(
//                     leading: Ink(
//                         decoration: const ShapeDecoration(
//                             shape: CircleBorder(), color: Color(0xff0F6868)),
//                         child: const SizedBox(
//                           width: 35,
//                           height: 35,
//                           child:
//                               Icon(Icons.alarm, size: 20, color: Colors.white),
//                         )),
//                     title: Text(
//                       "${booking['booking_date']}",
//                     ),
//                   ),

//                   ListTile(
                    
//                     leading: Ink(
//                         decoration: const ShapeDecoration(
//                             shape: CircleBorder(), color: Color(0xff0F6868)),
//                         child: const SizedBox(
//                           width: 35,
//                           height: 35,
//                           child: Icon(Icons.currency_rupee,
//                               size: 20, color: Colors.white),
//                         )),
//                     title: Ink(
//                         decoration: const ShapeDecoration(
//                             shape: RoundedRectangleBorder(
//                                 side: BorderSide.none,
//                                 borderRadius: BorderRadius.horizontal(
//                                     left: Radius.circular(30),
//                                     right: Radius.circular(30))),
//                             color: Color(0xff0F6868)),
//                         child:  SizedBox(
//                           height: 35,
//                           child: TextField(
//                             controller: _textEditingController,
//                             decoration: const InputDecoration(
//                                 border: InputBorder.none,
//                                 contentPadding: EdgeInsets.only(bottom: 15)),
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20),
//                           ),
//                         )),
//                     trailing: FilledButton(
//                         onPressed: () {
//                           rtvv();
//                           print(booking);
//                         },
//                         style: const ButtonStyle(
//                             backgroundColor:
//                                 MaterialStatePropertyAll(Color(0xff0F6868))),
//                         child: const Text(
//                           'Respond',
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         )),
//                   )

// ,
// SizedBox(height: 20,)
// // Padding(
// //   padding: const EdgeInsets.all(15.0),
// //   child:   Center(child:FilledButton(onPressed: () {

// //   print(booking)

// //                           },

// //                           style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff0F6868))),

// //                            child: Text('Send Requests   ₹ ${booking['calculated_price']} ',style: const TextStyle( color: Colors.white,fontWeight: FontWeight.bold),)),

// //                   ),
// // )
//                 ]),
//                 isExpanded: _isExpandedList[index],
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
