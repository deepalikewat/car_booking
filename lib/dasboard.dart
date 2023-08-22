// import 'dart:convert';

// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
// import 'package:lorry/finddriver.dart';
// import 'package:lorry/viewprofile.dart';

// class Newbooking extends StatefulWidget {
//   const Newbooking({super.key, required this.title});

//   final String title;

//   @override
//   State<Newbooking> createState() => Newbookingstate();
// }

// class GeocodingService {
//   static const String apiKey = 'AIzaSyCFAovotUynUVLXytFxhkulPpviRDJQjtI';

//   Future<Map<String, dynamic>> getLocationData(String address) async {
//     final response = await http.get(Uri.parse(
//         'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey'));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final results = data['results'];
//       if (results.isNotEmpty) {
//         final location = results[0]['geometry']['location'];
//         final latitude = location['lat'];
//         final longitude = location['lng'];
//         final components = results[0]['address_components'];
//         String? pincode;

//         for (var component in components) {
//           final types = component['types'];
//           if (types.contains('postal_code')) {
//             pincode = component['long_name'];
//             break;
//           }
//         }

//         if (pincode != null) {
//           return {
//             'latitude': latitude,
//             'longitude': longitude,
//             'pincode': pincode,
//           };
//         } else {
//           final nearestPincode = await getNearestPincode(latitude, longitude);
//           return {
//             'latitude': latitude,
//             'longitude': longitude,
//             'pincode': nearestPincode,
//           };
//         }
//       } else {
//         throw Exception('No results found for the address');
//       }
//     } else {
//       throw Exception('Request failed with status: ${response.statusCode}');
//     }
//   }

//   Future<String> getNearestPincode(double latitude, double longitude) async {
//     final response = await http.get(Uri.parse(
//         'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey'));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final results = data['results'];
//       if (results.isNotEmpty) {
//         final components = results[0]['address_components'];
//         for (var component in components) {
//           final types = component['types'];
//           if (types.contains('postal_code')) {
//             return component['long_name'];
//           }
//         }
//       }
//     }

//     throw Exception('No nearest pincode found');
//   }
// }

// class PlacesApi {
//   static const String apiKey = 'AIzaSyCFAovotUynUVLXytFxhkulPpviRDJQjtI';

//   static Future<List<Prediction>> getPlacePredictions(String input) async {
//     const apiKeyParam = 'key=$apiKey';
//     final inputParam = 'input=${Uri.encodeQueryComponent(input)}';
//     const typesParam = 'types=address';
//     const languageParam = 'language=en';

//     final endpoint =
//         'https://maps.googleapis.com/maps/api/place/autocomplete/json?$inputParam&$typesParam&$languageParam&$apiKeyParam';

//     final response = await http.get(Uri.parse(endpoint));
//     if (response.statusCode == 200) {
//       final predictions = jsonDecode(response.body)['predictions'] as List;
//       return predictions
//           .map((prediction) => Prediction.fromJson(prediction))
//           .toList();
//     } else {
//       throw Exception('Failed to fetch place predictions');
//     }
//   }
// }

// class Prediction {
//   final String description;
//   Prediction({required this.description});

//   factory Prediction.fromJson(Map<String, dynamic> json) {
//     return Prediction(description: json['description']);
//   }
// }

// class Newbookingstate extends State<Newbooking> {
//   Future<List<String>> getSuggestedAddresses(String pattern) async {
//     final predictions = await PlacesApi.getPlacePredictions(pattern);

//     final suggestions =
//         predictions.map((prediction) => prediction.description).toList();

//     return suggestions;
//   }

//   double screenxp = 2.7;

// //  @override
// //   void initState() {
// //     super.initState();
// //     SystemChannels.textInput.invokeMethod('TextInput.hide');
// //     SystemChannels.textInput
// //         .setMethodCallHandler((MethodCall call) async {
// //       if (call.method == 'TextInput.show') {
// //         setState(() {

// //           screenxp= 4;

// //         });
// //       } else if (call.method == 'TextInput.hide') {
// //         setState(() {

// //          screenxp= 2.7;

// //         });
// //       }
// //     });
// //   }
//   String distancex = "0.00 km";
//   String farex = "Fare";
//   Set<Marker> markers = Set();

//   List<LatLng> _polylineCoordinates = [];
//   Set<Polyline> _polylines = {};


//   final TextEditingController _controllerdx = TextEditingController();

// Future<void> _selectDate(BuildContext context) async {
//     final DateTime? selected = await showDatePicker(
//       context: context,

//       initialDate: DateTime.now(),
//       firstDate: DateTime(1950),
//       lastDate: DateTime(2025),
      
//     );

//     if (selected != null) {

//  final dateFormat = DateFormat('yyyy-MM-dd');
//       final formattedDate = dateFormat.format(selected);
//       _controllerdx.text=formattedDate.toString();

//     }
//   }


  
//   void _calculateShortestPath() async {
//     LatLng start = mk1.position; // Start location
//     LatLng end = mk2.position; // End location

//     setState(() {
//       markers.clear();

//       markers.add(mk1);
//       markers.add(mk2);
//     });

//     // Make an API request to calculate the shortest path
//     String apiKey = 'AIzaSyCFAovotUynUVLXytFxhkulPpviRDJQjtI';
//     String url =
//         'https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=$apiKey';
//     http.Response response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);

//       List<dynamic> routes = data['routes'];
//       if (routes.isNotEmpty) {
//         List<dynamic> legs = routes[0]['legs'];
//         List<dynamic> steps = legs[0]['steps'];

//         _polylineCoordinates.clear();
//         steps.forEach((step) {
//           double startLat = step['start_location']['lat'];
//           double startLng = step['start_location']['lng'];
//           _polylineCoordinates.add(LatLng(startLat, startLng));

//           double endLat = step['end_location']['lat'];
//           double endLng = step['end_location']['lng'];
//           _polylineCoordinates.add(LatLng(endLat, endLng));
//         });

//         setState(() {
//           distancex = legs[0]["distance"]["text"];

//           farex = legs[0]["distance"]["value"].toString();
//           mapController.moveCamera(
//             CameraUpdate.newLatLngBounds(
//               LatLngBounds(
//                 southwest: LatLng(
//                     data["routes"][0]["bounds"]['southwest']['lat'],
//                     data["routes"][0]["bounds"]['southwest']['lng']),
//                 northeast: LatLng(
//                     data["routes"][0]["bounds"]['northeast']['lat'],
//                     data["routes"][0]["bounds"]['northeast']['lng']),
//               ),
//               10.0,
//             ),
//           );

//           Polyline polyline = Polyline(
//             polylineId: const PolylineId('shortestPath'),
//             color: const Color(0xFF7400EF),
//             points: _polylineCoordinates,
//             width: 4,
//           );
//           _polylines.add(polyline);
//         });
//       }
//     }
//   }

//  void _showAlert(BuildContext context , {String titlex="",String msg=""}) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.grey[900], // Customize background color
//           title:   Text(
            
//            titlex,
//            textAlign: TextAlign.center,
//             style: const TextStyle(color: Colors.white),
//           ),
//           content:  Text(
//             msg,
//             textAlign: TextAlign.center,
//             style: const TextStyle(color: Colors.white),
//           ),
//           actions: <Widget>[
//             ElevatedButton(
              
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Customize button color
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Center(child: Text(
//                 'OK',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.white),
//               )),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Marker mk1 = const Marker(markerId: MarkerId("Pick Up"));
//   Marker mk2 = const Marker(markerId: MarkerId("distanation"));
//   bool isupdate = false;
//   bool isupdate2 = false;
//   final TextEditingController _controllerd = TextEditingController();
//   final TextEditingController _controllers = TextEditingController();

//   late GoogleMapController mapController;

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenwid = MediaQuery.of(context).size.width;

//     Marker MK1 = const Marker(markerId: MarkerId("Pick Up"));

//     return Scaffold(
//         bottomNavigationBar:
//             BottomNavigationBar(
//               onTap: (value) {
                
//                 if (value==1){
                     
//   Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const Finddriver(title: "title")));
            
//                 }
//                 if (value==2){
                     
//   Navigator.push(context,
//                   MaterialPageRoute(builder: (context) =>  ViewProfile()));
            
//                 }
                
//               },
//               items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
            
//             icon: Icon(Icons.history),
//             label: 'Boking History',
            
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.people),
//             label: 'Profile',
//           ),
//         ]),
//         // appBar: AppBar(
//         //   title: const Text(
//         //     "New Booking",
//         //     style: TextStyle(color: Colors.white),
//         //   ),
//         //   backgroundColor: Colors.blue,
//         // ),
//         backgroundColor: const Color(0xffF8FBFF),
//         body:SingleChildScrollView( child: 
//         Center(
//             child: Column(children: [
//           SizedBox(
//               height: screenHeight / 2.5,
//               child: GoogleMap(
//                 onMapCreated: (GoogleMapController controller) {
//                   mapController = controller;
//                 },
//                 myLocationEnabled: true,
//                 initialCameraPosition: const CameraPosition(
//                     target: LatLng(23.4516875, 87.4473951), zoom: 10),
//                 markers: markers,
//                 polylines: _polylines,
//               )),
         
         
        
//          Container(
//           margin: const EdgeInsets.all(15),
//           padding: const EdgeInsets.all(20),
//           decoration:BoxDecoration(
//               color: const Color(0xFFF0F2F5),
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: const [
//                 // BoxShadow(
//                 //   color: Colors.black,
//                 //   offset: Offset(4, -4),
//                 //   blurRadius: 50,
//                 //   spreadRadius: 3



//                 // )
//               ]
//             ),

//           child:  Column(
            
//             children: [

        
      


         
//          Padding(


//               padding: const EdgeInsets.only(top: 10),
//               child: TypeAheadFormField<String>(
//                 suggestionsBoxVerticalOffset: -60,
//                 textFieldConfiguration: TextFieldConfiguration(
//                   controller: _controllers,
//                   decoration: const InputDecoration(

//                     fillColor: Colors.white,
//                     filled: true,
//                     // suffixIcon: IconButton(icon: const Icon(Icons.add),onPressed: (){

//                     //               },),

//                     prefixIcon: Padding(padding: EdgeInsets.only(left: 20, right: 20),child: Icon(
                      
//                       Icons.location_pin,
//                       color: Colors.green,
//                     )),
//                     label: Text('Pick UP Point',style: const TextStyle(color: Colors.purple),),
//                     border: OutlineInputBorder(

//                       borderRadius: BorderRadius.all( Radius.circular(15))
//                     ),
//                   ),
//                 ),
//                 suggestionsCallback: (pattern) async {
//                   return getSuggestedAddresses(pattern);
//                 },
//                 itemBuilder: (context, suggestion) {
//                   return ListTile(
//                     title: Text(suggestion),
//                   );
//                 },
//                 onSuggestionSelected: (suggestion) async {
//                   _controllers.text = suggestion;
//                   final pincodeS =
//                       await GeocodingService().getLocationData(suggestion);

//                   setState(() {
//                     mk1 = Marker(
//                         markerId: const MarkerId("Pick Up Point"),
//                         icon: BitmapDescriptor.defaultMarkerWithHue(
//                             BitmapDescriptor.hueGreen),
//                         visible: true,
//                         position: LatLng(
//                             pincodeS["latitude"], pincodeS["longitude"]));

//                     isupdate = true;
//                     if (isupdate2) {
//                       _calculateShortestPath();
//                     }
//                   });

// // print(pincode_s);
//                 },
//               )),
//           const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
//           TypeAheadFormField<String>(
//             suggestionsBoxVerticalOffset: -100,
//             textFieldConfiguration: TextFieldConfiguration(
//               controller: _controllerd,
              
//               decoration: const InputDecoration(
//                 fillColor: Colors.white,
//                     filled: true,
//                 prefixIcon:Padding(padding: EdgeInsets.only(left: 20, right: 20),child:  Icon(
//                   Icons.location_pin,
//                   color: Colors.red,
//                 )),
//                 label: Text('Destination Point',style: const TextStyle(color: Colors.purple),),
//                border: OutlineInputBorder(

//                       borderRadius: BorderRadius.all( Radius.circular(15))
//                     ),
//               ),
//             ),
//             suggestionsCallback: (pattern) async {
//               return getSuggestedAddresses(pattern);
//             },
//             itemBuilder: (context, suggestion) {
//               return ListTile(
//                 title: Text(suggestion,
//                 style: const TextStyle(color: Colors.purple),),
//               );
//             },
//             onSuggestionSelected: (suggestion) async {
//               final pincodeS =
//                   await GeocodingService().getLocationData(suggestion);

//               _controllerd.text = suggestion;

//               setState(() {
//                 mk2 = Marker(
//                     markerId: const MarkerId("Pick Up Point"),
//                     icon: BitmapDescriptor.defaultMarkerWithHue(
//                         BitmapDescriptor.hueBlue),
//                     visible: true,
//                     position:
//                         LatLng(pincodeS["latitude"], pincodeS["longitude"]));

//                 isupdate2 = true;
//                 if (isupdate) {
//                   _calculateShortestPath();
//                 }
//               });
//             },
//           ),







//           const Padding(padding: EdgeInsets.only(top: 5)),
//           const TextField(
//               decoration: InputDecoration(
//             hintText: "0.00",
//              border: OutlineInputBorder(

//                       borderRadius: BorderRadius.all( Radius.circular(15))
//                     ),
//             prefixIcon: Padding(padding: EdgeInsets.only(left: 20, right: 20),child:  Icon(
//               Icons.toys,
//               color: Colors.purple,
//             )),
//             focusColor: Colors.black,
//             label: Text(
//               "Product Type",
//               style: TextStyle(color: Colors.purple),
//             ),
//             filled: true,
//             fillColor: Colors.white,
           
           
//             hintStyle: TextStyle(
//               color: Colors.grey,
//             ),
//           )),







//           const Padding(padding: EdgeInsets.only(top: 5)),
//            TextField(
//             controller: _controllerdx,
//            onTap: (){_selectDate(context);
//                   },
                  
//               decoration: const InputDecoration(
//              border: OutlineInputBorder(

//                       borderRadius: BorderRadius.all( Radius.circular(15))
//                     ),
//             prefixIcon: Padding(padding: EdgeInsets.only(left: 20, right: 20),child:  Icon(
//               Icons.calendar_month,
//               color: Colors.purple,
//             )),
//             focusColor: Colors.black,
//             label: Text(
//               "When",
//               style: TextStyle(color: Colors.purple),
//             ),
//             filled: true,
//             fillColor: Colors.white,
//             // enabledBorder: const OutlineInputBorder(
//             //   borderSide: BorderSide(color: Colors.blue),
//             // ),
//             // focusedBorder: const OutlineInputBorder(
//             //   borderSide: BorderSide(color: Colors.blue),
//             // ),
//             hintStyle: TextStyle(
//               color: Colors.grey,
//             ),
//           )),






//           const Padding(padding: EdgeInsets.only(top: 5)),
//           TextField(
//               decoration: InputDecoration(
//             hintText: "0.00",
//              border: const OutlineInputBorder(

//                       borderRadius: BorderRadius.all( Radius.circular(15))
//                     ),
//             prefixIcon: const Padding(padding: EdgeInsets.only(left: 20, right: 20),child:  Icon(
//               Icons.currency_rupee,
//               color: Colors.purple,
//             )),
//             focusColor: Colors.black,
//             label: Text(
//               farex,
//               style: const TextStyle(color: Colors.purple),
//             ),
//             filled: true,
//             fillColor: Colors.white,
//             // enabledBorder: const OutlineInputBorder(
//             //   borderSide: BorderSide(color: Colors.blue),
//             // ),
//             // focusedBorder: const OutlineInputBorder(
//             //   borderSide: BorderSide(color: Colors.blue),
//             // ),
//             hintStyle: const TextStyle(
//               color: Colors.grey,
//             ),
//           )),







//           const Padding(padding: EdgeInsets.only(top: 5)),



//           TextField(
//               decoration: InputDecoration(

//                  border: const OutlineInputBorder(

//                       borderRadius: BorderRadius.all( Radius.circular(15))
//                     ),
//             hintText: "0.00",
//             prefixIcon: const Padding(padding: EdgeInsets.only(left: 20, right: 20),child:  Icon(
//               Icons.social_distance,
//               color: Colors.purple,
//             )),
//             focusColor: Colors.black,
//             enabled: false,
//             label: Text(
//               distancex,
//               style: const TextStyle(color: Colors.purple),
//             ),
//             filled: true,
//             fillColor: Colors.white,
//             // enabledBorder: const OutlineInputBorder(
//             //   borderSide: BorderSide(color: Colors.blue),
//             // ),
//             // focusedBorder: const OutlineInputBorder(
//             //   borderSide: BorderSide(color: Colors.blue),
//             // ),
//             hintStyle: const TextStyle(
//               color: Colors.grey,
//             ),
//           )),
//           Padding(
//               padding: const EdgeInsets.all(10),
//               child: Container(
//                 height: 50.0,
//                 width: 200,
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(12)),
//                     gradient: LinearGradient(
//                         end: Alignment.topCenter,
//                         begin: Alignment.bottomCenter,
//                         colors: [
//                           Color(0xFF1b3c55),
//                           Color.fromARGB(255, 0, 72, 238)
//                         ])),
//                 child: ElevatedButton(
//                   onPressed: () {


// _showAlert(context,titlex: "Meassage",msg:"Created Suessufully");

//                   },
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.transparent,
//                       shadowColor: Colors.transparent),
//                   child: const Text("Find Driver",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500)),
//                 ),
//               )),



        
       
       
           
            
          

    

//           ]

//           )
//          )

//             ]))

//         )
//     );
//   }

//   }

// class CustomTextEditingController extends TextEditingController {
//   @override
//   void clear() {
//     if (text.isNotEmpty) {
//       // Prevent clearing and closing the suggestions
//       text = '';
//       notifyListeners();
//     }
//   }
// }
