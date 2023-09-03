import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'dart:ui';

import 'package:flutter/material.dart';

class DriverDashBoard extends StatefulWidget {
  @override
  State<DriverDashBoard> createState() => DriverDashBoardx();
}




class DriverDashBoardx extends State<DriverDashBoard> {


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
    
  List<Placemark> placemarks = await placemarkFromCoordinates(23.5830, 87.5153
);


    print('raju${placemarks[0].name}'); 
    
//    _determinePosition().then((value)  async {

//   List<Placemark> placemarks = await placemarkFromCoordinates(23.5830, 87.5153
// );


//     print('raju${placemarks[0]}'); });
//   //  print(_determinePosition());
    
  }

final TextEditingController _textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    Future<void> sendloc() async {
      await Future.delayed(Duration(seconds: 2));

      setState(() {});
    }

    return Scaffold(
        key: _scaffoldKey,
        
        drawer: const Drawer(backgroundColor: Color(0xff0F6868)),
        body: Stack(
          
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
                      padding: const EdgeInsets.only(
                         top: 10,
                         left: 15,
                         right: 20
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            icon: const Icon(
                              Icons.menu,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Return Lorry",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            icon: const Icon(
                              Icons.circle_notifications,
                              size: 40,
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
                                width: 60,
                                height: 60,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Column(
                                children: [
                                  Text(
                                    "data",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "data",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 25,
                                    ),
                                  )
                                ],
                              ),
                              const Expanded(child: Text("")),
                              FilledButton(
                                  onPressed: () {},
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.white),
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.symmetric(
                                              horizontal: 25))),
                                  child: const Text(
                                    "☢ Refresh",
                                    style: TextStyle(
                                        color: Color(0xff44c951),
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
                      child: const Row(
                        children: [
                          // Text("data",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 16, fontWeight: FontWeight.bold),),
        
                          SizedBox(
                              width: 180,
                              child:
                                  MarqueeText(text: "Last Updated Location")),
                          Expanded(child: Text("")),
                          Text("10:00",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
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
              height: xheight * .65 ,
              padding: EdgeInsets.only(top: 30 ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: 
              

SingleChildScrollView(
  child:   ExpansionPanelList(
  

            expandIconColor: Color.fromARGB(255, 11, 75, 75),
  
            elevation: 1,
  
  
            expansionCallback: (int panelIndex, bool isExpanded) {
  
              setState(() {
  
  
  
                    _isExpandedList = List.generate(bookingData.length, (index) => false);
  
                                    _isExpandedList[panelIndex] = !isExpanded;
  
                                    _textEditingController.text="${bookingData.elementAt(panelIndex)['calculated_price']}";
  
  
  
  
  
              });
  
            },
  
            children: bookingData.asMap().entries.map((entry) {
  
              final int index = entry.key;
  
              final Map<String, dynamic> booking = entry.value;
  
  
  
              return ExpansionPanel(
  
  
                headerBuilder: (BuildContext context, bool isExpanded) {
  
  

                  return ListTile(
                  
                    leading: CircleAvatar(
                  
                      backgroundImage:
                  
                          NetworkImage(booking['booking_user']['dp']),
                  
                    ),
                  
                    title: Text(booking['booking_user']['name']),
                  
                    subtitle: Text(booking['material_type']),
                  
                    trailing: FilledButton(
                  
                        onPressed: () {},
                  
                        style: const ButtonStyle(
                  
                            backgroundColor:
                  
                                MaterialStatePropertyAll(Color(0x401D8989))),
                  
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
  
                            shape: CircleBorder(), color: Color(0xff0F6868)),
  
                        child: const SizedBox(
  
                          width: 35,
  
                          height: 35,
  
                          child:
  
                              Icon(Icons.home, size: 20, color: Colors.white),
  
                        )),
  
                    title: Text("${booking['destination_point']['address']}"),
  
                  ),
  
                  ListTile(
  
                    leading: Ink(
  
                        decoration: const ShapeDecoration(
  
                            shape: CircleBorder(), color: Color(0xff0F6868)),
  
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
  
                            shape: CircleBorder(), color: Color(0xff0F6868)),
  
                        child: const SizedBox(
  
                          width: 35,
  
                          height: 35,
  
                          child:
  
                              Icon(Icons.alarm, size: 20, color: Colors.white),
  
                        )),
  
                    title: Text(
  
                      "${booking['booking_date']}",
  
                    ),
  
                  ),
  
  
  
                  ListTile(
  
                    
  
                    leading: Ink(
  
                        decoration: const ShapeDecoration(
  
                            shape: CircleBorder(), color: Color(0xff0F6868)),
  
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
  
                        child:  SizedBox(
  
                          height: 35,
  
                          child: TextField(
  
                            controller: _textEditingController,
  
                            decoration: const InputDecoration(
  
                                border: InputBorder.none,
  
                                contentPadding: EdgeInsets.only(bottom: 15)),
  
                            textAlign: TextAlign.center,
  
                            style: const TextStyle(
  
                                color: Colors.white,
  
                                fontWeight: FontWeight.bold,
  
                                fontSize: 20),
  
                          ),
  
                        )),
  
                    trailing: FilledButton(
  
                        onPressed: () {
  
                          rtvv();
  
                          print(booking);
  
                        },
  
                        style: const ButtonStyle(
  
                            backgroundColor:
  
                                MaterialStatePropertyAll(Color(0xff0F6868))),
  
                        child: const Text(
  
                          'Respond',
  
                          style: TextStyle(
  
                              color: Colors.white, fontWeight: FontWeight.bold),
  
                        )),
  
                  )
  
  
  
  ,
  
  
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
        
        












            )
          ],
        ));
  }
}

class MarqueeText extends StatefulWidget {
  final String text;

  const MarqueeText({super.key, required this.text});

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollText();
  }

  void _scrollText() async {
    // while (true) {
    //   await Future.delayed(const Duration(milliseconds: 100));
    //   if (_scrollController.position.maxScrollExtent > 0) {
    //     if (_scrollController.position.pixels ==
    //         _scrollController.position.maxScrollExtent) {
    //       _scrollController.jumpTo(0.0);
    //     } else {
    //       _scrollController.animateTo(
    //         _scrollController.position.pixels + 1.0,
    //         duration: const Duration(milliseconds: 100),
    //         curve: Curves.linear,
    //       );
    //     }
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Text(
        widget.text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
