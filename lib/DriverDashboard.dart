import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:car_booking/UploadDashboard.dart';
import 'package:car_booking/front.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
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
  void initState() {
    super.initState();
    setvaluex();
_scrollText();

        _scrollController = ScrollController();


Timer.periodic(const Duration(seconds: 1), (timer) {

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






    // final dcx = await http.post(
    //     Uri.parse("https://admin.returnlorry.com/appservice/getbookingrequest"),
    //     body: jsonEncode({
    //       "Token": prefs.getString("Token"),
    //       "userId": prefs.getString("userId"),
    //       "userPhone": prefs.getString("userPhone"),
    //       "userType": prefs.getString("userType"),
    //     }));

final longlatx=await _determinePosition();


List<Placemark> placemarks = await placemarkFromCoordinates(longlatx.latitude, longlatx.longitude);

setState(() {
  
  
  Lasr_update_location="${placemarks[0].name} ${placemarks[0].locality} ${placemarks[0].subAdministrativeArea} ${placemarks[0].administrativeArea}   ${placemarks[0].postalCode  }";

});

 final dcxv = await http.post(
        Uri.parse("https://admin.returnlorry.com/appservice/vehicleupdatecurrentlocation"),
        body: jsonEncode({
          "Token": prefs.getString("Token"),
          "userId": prefs.getString("userId"),
          "userPhone": prefs.getString("userPhone"),
          "userType": prefs.getString("userType"),

          "current_lat": "${longlatx.latitude}",
    "current_long": "${longlatx.longitude}",
    "current_pincode": "${placemarks[0].postalCode}"
        }));


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

    setState(() {
      loadingx=false;
      _isExpandedList = List.generate(bookingData.length, (index) => false);
    });

// setState(() {

//       _isExpandedList = List.generate(bookingData.length, (index) => false);

//   print("raju");
// });
    // Map<String, dynamic> ryo={
    //   "request_booking_id": 1,
    //   "booking_user": {
    //     "id": 1,
    //     "name": "Raju",
    //     "dp": "https://autohyre.com/assets/images/output-onlinepngtools.png"
    //   },
    //   "pick_up_point": {
    //     "lat": "24.185764",
    //     "long": "87.791982",
    //     "pincode": "713148",
    //     "address": "sdfsdf,sdf,sd,fdsf,d,f"
    //   },
    //   "destination_point": {
    //     "lat": "22.568660563718094",
    //     "long": "88.51089299422036",
    //     "pincode": "713148",
    //     "address": "sds,dfsdf,fdsdf"
    //   },
    //   "vehicle_type_id": 1,
    //   "material_weight": 2000,
    //   "material_type": "Plastic",
    //   "distance": 250,
    //   "calculated_price": 25000,
    //   "booking_date": "2023-05-20 12:31:57",
    //   "request_status": {"status_code": "0", "status": "Open"}
    // };

    // List<Placemark> placemarks = await placemarkFromCoordinates(23.5830, 87.5153);

    //   print('raju${placemarks[0].name}');

// setState(() {

//       _isExpandedList = List.generate(bookingData.length+1, (index) => false);
//       bookingData.add(ryo);

//   print("raju");
// });

//    _determinePosition().then((value)  async {

//   List<Placemark> placemarks = await placemarkFromCoordinates(23.5830, 87.5153
// );

//     print('raju${placemarks[0]}'); });
//   //  print(_determinePosition());
  }

  GoooGolgole(double sourceLatitude, double sourceLongitude,
      double destLatitude, double destLongitude) async {
    final directionsUri =
        'https://www.google.com/maps/dir/$sourceLatitude,$sourceLongitude/$destLatitude,$destLongitude';
    if (await canLaunchUrlString(directionsUri)) {
      await launchUrlString(directionsUri);
    } else {
      throw 'Could not launch $directionsUri';
    }
  }

  String _driver_email = "";
  String _driver_photo = "";
  String _driver_name = "";

  final TextEditingController _textEditingController = TextEditingController();
String Lasr_update_location="Last Updated Locatoion..............";

  setvaluex() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _driver_email = prefs.getString("driver_email") ?? "";
      _driver_photo = prefs.getString("owner_photo") ?? "";
      _driver_name = prefs.getString("driver_name") ?? "";

      print(_driver_photo);
      
    });
  }
      final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;


    Future<void> sendloc() async {
      await Future.delayed(const Duration(seconds: 2));

      setState(() {});
    }

    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                  child: Row(
                children: [
                  const ClipOval(
                      child: Image(
                    image: AssetImage("img/QT.jpeg"),
                    height: 80,
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _driver_name,
                        style: const TextStyle(
                            fontSize: 20,
                            color:Color.fromARGB(255, 20, 19, 19),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _driver_email,
                        style: const TextStyle(
                            fontSize: 15,
                            color:Color(0xff4E4E4E),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )),






              
              
                SizedBox(
                  height: xheight * 0.02,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ClipOval(
                          child: Container(
                            height: 40,
                            width: 40,
                            color: const Color(0xffE7E7E7),
                            child: const Icon(
                              Icons.menu,
                              size: 15,
                              color: Color(0xff116D6D),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "My Orders",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: xheight * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ClipOval(
                          child: Container(
                            height: 40,
                            width: 40,
                            color: const Color(0xffE7E7E7),
                            child: const Icon(
                              Icons.login,
                              size: 15,
                              color: Color(0xff116D6D),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Refer & Earn",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: xheight * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ClipOval(
                          child: Container(
                            height: 40,
                            width: 40,
                            color: const Color(0xffE7E7E7),
                            child: const Icon(
                              Icons.info,
                              size: 15,
                              color: Color(0xff116D6D),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "About Us",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: xheight * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ClipOval(
                          child: Container(
                            height: 40,
                            width: 40,
                            color: const Color(0xffE7E7E7),
                            child: const Icon(
                              Icons.share,
                              size: 15,
                              color: Color(0xff116D6D),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Share App",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: xheight * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ClipOval(
                          child: Container(
                            height: 40,
                            width: 40,
                            color: const Color(0xffE7E7E7),
                            child: const Icon(
                              Icons.quiz,
                              size: 15,
                              color: Color(0xff116D6D),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "FAQ",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: xheight * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ClipOval(
                          child: Container(
                            height: 40,
                            width: 40,
                            color: const Color(0xffE7E7E7),
                            child: const Icon(
                              Icons.textsms,
                              size: 15,
                              color: Color(0xff116D6D),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Terms & Conditions",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: xheight * 0.01,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ClipOval(
                          child: Container(
                            height: 40,
                            width: 40,
                            color: const Color(0xffE7E7E7),
                            child: const Icon(
                              Icons.description,
                              size: 15,
                              color: Color(0xff116D6D),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Privacy policy",
                        style: TextStyle(color: Color(0xff4E4E4E)),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: () async {
                    
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                           
                          return  Lorry();
                           

                         },));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: xwidth * .04,
                      ),
                      const ClipOval(
                        child: Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all( xwidth * 0.05)),
                      const Text(
                        "Log Out",
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: xheight * .45,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff1B7D7D), Color(0xff828448)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 15, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              icon: const Icon(
                                Icons.menu,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              "Return Lorry",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {

                                _scaffoldKey.currentState!.openDrawer();
                              },
                              icon: const Icon(
                                Icons.circle_notifications,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Color(0xfff1f5f3),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Image(
                                  image: AssetImage("img/dp.png"),
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _driver_name,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      _driver_email,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    )
                                  ],
                                ),

const Expanded(child: SizedBox()),


                                FilledButton(
                                    onPressed: () {
                                rtvv();
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white),
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: 15))),
                                    child: const Text(
                                      "☢ Refresh",
                                      style: TextStyle(
                                          color: Color(0xff44c951),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Color(0x5f749b83),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child:  Row(
                          children: [

                           
SizedBox( 
  width: xwidth*.6,
  child:   SingleChildScrollView(
  
        scrollDirection: Axis.horizontal,
  
        controller: _scrollController,
  
        child: Text(
  
  Lasr_update_location,
  
          style: const TextStyle(color: Colors.white, fontSize: 14),
  
        )
  
  ),
),
                            const Expanded(child: SizedBox()),
                            Text("00:$t",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            
              Container(
                width: xwidth,
                margin: EdgeInsets.only(top: xheight * .36),
                height: xheight * .65,
                padding: const EdgeInsets.only(top: 30),
                child: loadingx? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    SizedBox(width: 250,height: 250, child: CircularProgressIndicator(strokeWidth: 10,)),

                  ],
                ):bookingData.isEmpty? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

 Icon(
                      Icons.car_crash,
                      size: 100,
                      color: Colors.blue,
                    ),   
                    SizedBox(height: 10,),

                    Text("No Orders Abablable  Near You", textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                  ],
                ): SingleChildScrollView(
                  child: ExpansionPanelList(
                    expandIconColor: const Color.fromARGB(255, 11, 75, 75),
                    elevation: 1,
                    expansionCallback: (int panelIndex, bool isExpanded) {
                      setState(() {
                        _isExpandedList =
                            List.generate(bookingData.length, (index) => false);

                        _isExpandedList[panelIndex] = !isExpanded;

                        _textEditingController.text =
                            "${bookingData.elementAt(panelIndex)['calculated_price']}";
                      });
                    },
                    children: bookingData.asMap().entries.map((entry) {
                      final int index = entry.key;

                      final Map<String, dynamic> booking = entry.value;


                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: (booking['booking_user']['image'] == "https://admin.returnlorry.com/uploads/users/")
                                  ? const AssetImage("img/dp.png")
                                      as ImageProvider<Object>
                                  : NetworkImage(
                                      booking['booking_user']['image']),
                            ),
                            title: Text(
                                booking['booking_user']['name'] ?? "Unnamed"),
                            subtitle: Text(booking['material_type']),
                            trailing: FilledButton(
                                onPressed: () async {

                                  //xloca






                                  GoooGolgole(




                                      double.parse(booking['pick_up_point']['lat']),
                                      double.parse(booking['pick_up_point']['long']),
                                      double.parse(booking['destination_point']['lat']),
                                      double.parse(booking['destination_point']['long'])



                                  );

                                     


                                },
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0x401D8989))),
                                child: Text(
                                  '${booking['distance']} km',
                                  style: const TextStyle(
                                      color: Color(0xff0F6868),
                                      fontWeight: FontWeight.bold),
                                )),
                          );
                        },
                        body: Column(children: [
                          const Divider(),

                          ListTile(
                            leading: Ink(
                                decoration: const ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: Color(0xff0F6868)),
                                child: const SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Icon(Icons.home,
                                      size: 20, color: Colors.white),
                                )),
                            title: Text(
                                "${booking['destination_point']['address']}"),
                          ),

                          ListTile(
                            leading: Ink(
                                decoration: const ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: Color(0xff0F6868)),
                                child: const SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Icon(Icons.location_city,
                                      size: 20, color: Colors.white),
                                )),
                            title: Text(
                                'Pickup Point: ${booking['pick_up_point']['address']}'),
                          ),

                          ListTile(
                            leading: Ink(
                                decoration: const ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: Color(0xff0F6868)),
                                child: const SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Icon(Icons.alarm,
                                      size: 20, color: Colors.white),
                                )),
                            title: Text(
                              "${booking['booking_date']}",
                            ),
                          ),

                          ListTile(
                            leading: Ink(
                                decoration: const ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: Color(0xff0F6868)),
                                child: const SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Icon(Icons.currency_rupee,
                                      size: 20, color: Colors.white),
                                )),
                            title: Ink(
                                decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide.none,
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(30),
                                            right: Radius.circular(30))),
                                    color: Color(0xff0F6868)),
                                child: SizedBox(
                                  height: 35,
                                  child: TextField(
                                    controller: _textEditingController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(bottom: 15)),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )),
                            trailing: FilledButton(
                                onPressed: () {
                                  booking_respond({
                                    "request_booking_id":
                                        booking["request_booking_id"],
                                    "booking_user_id": booking["booking_user"]
                                        ["id"],
                                    "calculated_price":
                                        booking["calculated_price"],
                                    "burgaining_price":
                                        _textEditingController.text,
                                    "response_status": "1"
                                  });

                                  print(booking);
                                },
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xff0F6868))),
                                child: const Text(
                                  'Respond',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),

                          // Padding(

                          //   padding: const EdgeInsets.all(15.0),

                          //   child:   Center(child:FilledButton(onPressed: () {

                          //   print(booking)

                          //                           },

                          //                           style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff0F6868))),

                          //                            child: Text('Send Requests   ₹ ${booking['calculated_price']} ',style: const TextStyle( color: Colors.white,fontWeight: FontWeight.bold),)),

                          //                   ),

                          // )
                        ]),
                        isExpanded: _isExpandedList[index],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
 

  }

  void booking_respond(Map<String, Object> map) {




    
  }

int t=0;


 
 
   late ScrollController _scrollController;








  void _scrollText() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted){
      if (_scrollController.position.maxScrollExtent > 0) {

        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _scrollController.jumpTo(0.0);


        } else {


          _scrollController.animateTo(
            _scrollController.position.pixels + 5.0,
            duration: const Duration(milliseconds: 100),
            curve: Curves.linear,
          );


        }
      }
    }
    }
  }

    @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

}
