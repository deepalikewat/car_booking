
import 'dart:convert';
import 'package:car_booking/UserDasboard.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomerOrderResponce extends StatefulWidget {

 @override
  State<CustomerOrderResponce> createState() => CustomerOrderResponcepvt();



}




class CustomerOrderResponcepvt extends State<CustomerOrderResponce> {






 Future<void> rtvv() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

setState(() {
  loadingx=true;
});







    final dc = await http.post(
      
        Uri.parse("https://admin.returnlorry.com/appservice/getbookingrequestlist"),
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

      print("r booking data");
      print(bookingData);
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








@override
  void initState() {
  
rtvv();  

  }



  List<Map<String, dynamic>> bookingData = [];

bool loadingx=true;
  List<bool> _isExpandedList = [];

String pricez="";
  @override
  Widget build(BuildContext context) {
  
  
  

return   Scaffold(


  appBar: AppBar(title:
    

      Center(child: const Text("Booking Responces", textAlign: TextAlign.center,)),
      
actions: [

  


       IconButton( onPressed:() {
                     rtvv();

             },icon: const Icon(Icons.refresh),)
    ],
  ),
  

body: 
           Container(
           
                padding: const EdgeInsets.only(top: 30),
                child: loadingx? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      SizedBox(width: 250,height: 250, child: CircularProgressIndicator(strokeWidth: 10,)),
                           
                    ],
                  ),
                ):bookingData.isEmpty? const Center(
                  child: Column(
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
                  ),
                ): SingleChildScrollView(
                  child: ExpansionPanelList(
                    expandIconColor: const Color.fromARGB(255, 11, 75, 75),
                    elevation: 1,
                    expansionCallback: (int panelIndex, bool isExpanded) {
                      setState(() {
                        _isExpandedList =
                            List.generate(bookingData.length, (index) => false);
           
                        _isExpandedList[panelIndex] = !isExpanded;
           
                      });
                    },
                    children: bookingData.asMap().entries.map((entry) {
                      final int index = entry.key;
           
                      final Map<String, dynamic> booking = entry.value;
           
           
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: (booking['booking_user']['image'] != "https://admin.returnlorry.com/uploads/users/")
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
                                '${booking['pick_up_point']['address']}'),
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
                            title: Text("${booking['calculated_price']}"),

                            trailing:FilledButton(
                                onPressed: () async {
                                  // booking_respond({
                                  //   "request_booking_id":
                                  //       booking["request_booking_id"],
                                  //   "booking_user_id": booking["booking_user"]
                                  //       ["id"],
                                  //   "calculated_price":
                                  //       booking["calculated_price"],
                                  //   "burgaining_price":
                                  //       _textEditingController.text,
                                  //   "response_status": "1"
                                  // });
                            


                                                              //   "request_booking_id":
                                  //       booking["request_booking_id"],

                                      final SharedPreferences prefs = await SharedPreferences.getInstance();


    final dc = await http.post(
      
        Uri.parse("https://admin.returnlorry.com/appservice/cancelbookingrequest"),
        body: jsonEncode({
          "Token": prefs.getString("Token"),
          "userId": prefs.getString("userId"),
          "userPhone": prefs.getString("userPhone"),
          "userType": prefs.getString("userType"),
          "booking_request_id": booking["request_booking_id"]
        }));



    final rty = jsonDecode(dc.body)["data"]["msg"];



            ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(rty),backgroundColor: Colors.red,));

                                  print(booking);
                                  print(rty);
                                },
                                style:  ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(  booking['request_status']['status_code']== 0 ? 0xff0F6868:0xff6f0000))),
                                child:  Padding(
                              padding: const EdgeInsets.symmetric(horizontal:10.0),
                                  child: Text(booking['request_status']['status'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)
                                  
                                  ),
                                ),
                                                     
                                                    ),

                          )
           
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
 



);








  }



 
}