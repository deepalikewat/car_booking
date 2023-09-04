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
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xfff8fbff)),
        home: DriverDashBoard());

        

    //
  }
}


class Yix extends StatefulWidget {
  int otp=0;
  

  @override
  State<Yix> createState() => Dipf();
}


  
class Dipf extends State<Yix> {

    final xlist=<String>["Raju","deepali","qwertyuiop"];



  @override
  Widget build(BuildContext context) {
  


  
  
return  const Scaffold(

body: Center(


child:  ListTile(),






// child: ListView.builder(
//   itemCount: xlist.length,
  
  
//   itemBuilder: (BuildContext context, index) {
  
// return 

// InkWell(
//   onTap: () {
   
//    setState(() {
//      xlist.add("QT");
//    });
   

//   },
//   child:   SizedBox(
  
//     height: 80,
  
//     child: 
  
    
  
    
  
//       Row(
  
    
  
    
  
  
  
//       children: [
  
//     const SizedBox(width: 10,),
  
//         const Image(image: AssetImage("img/QT.jpeg"),width: 100,height: 100,),
  
  
  
//            Column(
  
//             crossAxisAlignment: CrossAxisAlignment.start,
  
//             children: [
  
        
  
        
  
//             const Text("Tata LPT 25211 Truck",style: TextStyle(fontSize: 20)),
  
//             Text("${xlist[index]}",style: const TextStyle(fontSize: 20),),
  
//             const Text("★ 4.1 (100)",style: TextStyle(fontSize: 20),)
  
        
  
//           ],)
  
     
  
//     ,
  
//       const SizedBox(width: 20,),
  
  
  
//      const Column(
  
//             crossAxisAlignment: CrossAxisAlignment.start,
  
//             children: [
  
        
  
        
  
//             Text("Price",style: TextStyle(fontSize: 20)),
  
//             Text("Raju Haldar",style: TextStyle(fontSize: 20),),
  
//             Text("★ 4.1 (100)",style: TextStyle(fontSize: 20),)
  
        
  
//           ],),
  
//       ],
  
    
  
//     ),
  
  
  
  
  
//   ),
// )

//  ;
// }
  
  
  
  
    
  
//   ),

)
);


  }

}



