
import 'dart:convert';
import 'package:car_booking/UserDasboard.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomerOrderResponce extends StatefulWidget {

int request_booking_id;

CustomerOrderResponce({super.key, required this.request_booking_id});

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
      
        Uri.parse("https://admin.returnlorry.com/appservice/getresponselist"),
        body: jsonEncode({
          "Token": prefs.getString("Token"),
          "userId": prefs.getString("userId"),
          "userPhone": prefs.getString("userPhone"),
          "userType": prefs.getString("userType"),
          "booking_request_id":widget.request_booking_id

        }));



    final rty = jsonDecode(dc.body)["data"]["data"];

print(rty);

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
    

      const Center(child: Text("Booking Responces", textAlign: TextAlign.center,)),
      
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
                              backgroundImage: (booking['responsed_driver']['driver_photo'] != "https://admin.returnlorry.com/uploads/users/")
                                  ? const AssetImage("img/dp.png")
                                      as ImageProvider<Object>
                                  : NetworkImage(
                                      booking['responsed_driver']['driver_photo']),
                            ),
                            title: Text(
                                booking['responsed_driver']['name'] ?? "Unnamed"),
                            subtitle: Text(booking['responsed_driver']['vehicle_no']),
                            trailing: FilledButton.icon(
                              
                              icon: const Icon(Icons.currency_rupee_outlined,color: Color.fromARGB(230, 4, 43, 43),),
                              
                                onPressed: () async {
           
           
                                     
           
           
                                },
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0x401D8989))),
                                label: Text(
                                  "${booking["burgaining_price"]}",
                                  style: const TextStyle(
                                      color: Color(0xff0F6868),
                                      fontWeight: FontWeight.bold),
                                )),
                          );
                        },
                        body: Column(children: [
                          const Divider(),
           
                          ListTile(
                           
                            
                            title: FilledButton(
                              
                              
                                onPressed: () async {
           
           
                                },
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0x401D8989))),
                                child: const Text(
                                  "Accept",
                                  style: TextStyle(
                                      color: Color(0xff0F6868),
                                      fontWeight: FontWeight.bold),
                                )),

                                trailing: FilledButton(
                              
                              
                                onPressed: () async {
           
           
                                },
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(64, 85, 3, 49))),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "Deny",
                                    style: TextStyle(
                                        color: Color(0xff0F6868),
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
           
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