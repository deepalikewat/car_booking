import 'dart:ui';

<<<<<<< HEAD
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
<<<<<<< HEAD

import 'dart:ui';

=======
import 'package:http/http.dart' as http;
>>>>>>> e9e1115 (x)
=======
>>>>>>> df16074 (vf)
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DriverDashBoard extends StatefulWidget {
  @override
  State<DriverDashBoard> createState() => DriverDashBoardx();
}

class DriverDashBoardx extends State<DriverDashBoard> {
  List<Map<String, dynamic>> bookingData = [];

bool loadingx=true;
  //   {
  //     "request_booking_id": 1,
  //     "booking_user": {
  //       "id": 1,
  //       "name": "Raju",
  //       "dp": "https://autohyre.com/assets/images/output-onlinepngtools.png"
  //     },
  //     "pick_up_point": {
  //       "lat": "24.185764",
  //       "long": "87.791982",
  //       "pincode": "713148",
  //       "address": "sdfsdf,sdf,sd,fdsf,d,f"
  //     },
  //     "destination_point": {
  //       "lat": "22.568660563718094",
  //       "long": "88.51089299422036",
  //       "pincode": "713148",
  //       "address": "sds,dfsdf,fdsdf"
  //     },
  //     "vehicle_type_id": 1,
  //     "material_weight": 2000,
  //     "material_type": "Plastic",
  //     "distance": 250,
  //     "calculated_price": 299,
  //     "booking_date": "2023-05-20 12:31:57",
  //     "request_status": {"status_code": "0", "status": "Open"}
  //   },
  //   {
  //     "request_booking_id": 1,
  //     "booking_user": {
  //       "id": 1,
  //       "name": "Raju",
  //       "dp": "https://autohyre.com/assets/images/output-onlinepngtools.png"
  //     },
  //     "pick_up_point": {
  //       "lat": "24.185764",
  //       "long": "87.791982",
  //       "pincode": "713148",
  //       "address": "sdfsdf,sdf,sd,fdsf,d,f"
  //     },
  //     "destination_point": {
  //       "lat": "22.568660563718094",
  //       "long": "88.51089299422036",
  //       "pincode": "713148",
  //       "address": "sds,dfsdf,fdsdf"
  //     },
  //     "vehicle_type_id": 1,
  //     "material_weight": 2000,
  //     "material_type": "Plastic",
  //     "distance": 250,
  //     "calculated_price": 25000,
  //     "booking_date": "2023-05-20 12:31:57",
  //     "request_status": {"status_code": "0", "status": "Open"}
  //   },
  //   // Add more test data as needed
  // ];

  List<bool> _isExpandedList = [];

  @override
  Widget build(BuildContext context) {

 double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;

   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


   
return Scaffold(key: _scaffoldKey,

    
    drawer: const Drawer(backgroundColor: Color(0xff0F6868)),
   body: Stack(
     children: [
       Container(
          height: xheight*.45,


          decoration: const BoxDecoration(
          
          gradient: LinearGradient(
                    colors: [Color(0xff1B7D7D), Color(0xff828448)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                  ),

        ),
                  
           child:  SafeArea(
             child: Column(
               children: [
                const SizedBox(height: 10,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                IconButton(onPressed: (){
_scaffoldKey.currentState!.openDrawer();
                }, icon: const Icon(Icons.menu,size: 40,color: Colors.white,),

                ),
                const Text("Return Lorry", textAlign: TextAlign.center, style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                 IconButton(onPressed: (){
_scaffoldKey.currentState!.openDrawer();
                }, icon: const Icon(Icons.circle_notifications,size: 40,color: Colors.white, ),

                ),
                
                ]
                
                
                
                ,)
               ],
             ),
           ),

       )
       ,


Container(
  width: xwidth,
  margin: EdgeInsets.only(top: xheight*.3),
  decoration: const BoxDecoration(


color: Color.fromARGB(255, 132, 17, 17),

borderRadius: BorderRadius.only(topLeft: Radius.circular(
  30
),topRight: Radius.circular(30))

  ),
  child:   const Column(
  
  
  
    children: [
  
  Text("data")
  
    ],
  
  ),
)



     ],
   )
       


try{
  
 if(!_scaffoldKey.currentState!.isDrawerOpen){
setState(() {


  if(t==0){

    rtvv();

  t=60;

  }

    t-=1;

});      
 
 }
}
catch(ixo){
  timer.cancel();

}
 });

    _isExpandedList = List.generate(bookingData.length, (index) => false);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> rtvv() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

setState(() {
  loadingx=true;
});
    final dc = await http.post(
        Uri.parse("https://admin.returnlorry.com/appservice/getbookingrequest"),
        body: jsonEncode({
          "Token": prefs.getString("Token"),
          "userId": prefs.getString("userId"),
          "userPhone": prefs.getString("userPhone"),
          "userType": prefs.getString("userType"),
        }));

    final rty = jsonDecode(dc.body)["data"]["data"];

    int i = 0;
    bookingData.clear();
try{
    for (var ty in rty) {
      i++;

      bookingData.add(ty);


    }
}catch(tc){
print(tc);

}
