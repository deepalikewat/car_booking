import 'package:car_booking/DriverDashboard.dart';
import 'package:flutter/material.dart';
import 'booking.dart';
import 'front.dart';
import 'map_with_autocomplete.dart';

void main() {
  runApp(MainApp());
}
//uuc

class MainApp extends StatelessWidget {
   MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xfff8fbff)),
        home: DriverDashBoard()

    );
        // A

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







)
);


  }

}



