import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_autocomplete_field/map_autocomplete_field.dart';

class UserDashBoard extends StatefulWidget {
  const UserDashBoard({super.key});

  @override

    State<UserDashBoard> createState() => UserDashBoardx();

}

class GeocodingService {
  static const String apiKey = 'AIzaSyCFAovotUynUVLXytFxhkulPpviRDJQjtI';

  Future<Map<String, dynamic>> getLocationData(String address) async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'];
      if (results.isNotEmpty) {
        final location = results[0]['geometry']['location'];
        final latitude = location['lat'];
        final longitude = location['lng'];
        final components = results[0]['address_components'];
        String? pincode;

        for (var component in components) {
          final types = component['types'];
          if (types.contains('postal_code')) {
            pincode = component['long_name'];
            break;
          }
        }

        if (pincode != null) {
          return {
            'latitude': latitude,
            'longitude': longitude,
            'pincode': pincode,
          };
        } else {
          final nearestPincode = await getNearestPincode(latitude, longitude);
          return {
            'latitude': latitude,
            'longitude': longitude,
            'pincode': nearestPincode,
          };
        }
      } else {
        throw Exception('No results found for the address');
      }
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  Future<String> getNearestPincode(double latitude, double longitude) async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'];
      if (results.isNotEmpty) {
        final components = results[0]['address_components'];
        for (var component in components) {
          final types = component['types'];
          if (types.contains('postal_code')) {
            return component['long_name'];
          }
        }
      }
    }

    throw Exception('No nearest pincode found');
  }
}

class PlacesApi {
  static const String apiKey = 'AIzaSyCFAovotUynUVLXytFxhkulPpviRDJQjtI';

  static Future<List<Prediction>> getPlacePredictions(String input) async {
    const apiKeyParam = 'key=$apiKey';
    final inputParam = 'input=${Uri.encodeQueryComponent(input)}';
    const typesParam = 'types=address';
    const languageParam = 'language=en';

    final endpoint =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?$inputParam&$typesParam&$languageParam&$apiKeyParam';

    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final predictions = jsonDecode(response.body)['predictions'] as List;
      return predictions
          .map((prediction) => Prediction.fromJson(prediction))
          .toList();
    } else {
      throw Exception('Failed to fetch place predictions');
    }
  }
}

class Prediction {
  final String description;
  Prediction({required this.description});

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(description: json['description']);
  }
}


  
















class UserDashBoardx  extends State<UserDashBoard>{




  GoogleMapController? _mapController;
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final apiKey ='AIzaSyDXLXII5-jnC-fJ5hSF3xc5ucf_O_ecOfQ';
  late LatLng _sourceLatLng=LatLng(21.1290, 82.7792);
  late LatLng _destinationLatLng=LatLng(21.1280, 82.7792);
  TextEditingController controller = TextEditingController();




Future<List<String>> getSuggestedAddresses(String pattern) async {
    final predictions = await PlacesApi.getPlacePredictions(pattern);

    final suggestions =
        predictions.map((prediction) => prediction.description).toList();

    return suggestions;
  }

  double screenxp = 2.7;





  String distancex = "0.00 km";
  String farex = "Fare";
  Set<Marker> markers = Set();

  List<LatLng> _polylineCoordinates = [];
  Set<Polyline> _polylines = {};










  @override
  Widget build(BuildContext context) {
    double xheight = MediaQuery.of(context).size.height;
    double xwidth = MediaQuery.of(context).size.width;

  TextEditingController srcctl = TextEditingController();

  final TextEditingController _controllerdx = TextEditingController();

Future<void> _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
      
    );

    if (selected != null) {

 final dateFormat = DateFormat('yyyy-MM-dd');
      final formattedDate = dateFormat.format(selected);
      _controllerdx.text=formattedDate.toString();

    }
  }
   
return  Scaffold(

body: Stack(
        children: [

SizedBox(height: xheight,),
          Container(
            height: xheight*.5,
            child: GoogleMap(
              mapType: MapType.normal,
                zoomControlsEnabled: false,

              initialCameraPosition: const CameraPosition(
                target: LatLng(21.1290, 82.7792),
                zoom: 15,
              ),
              onMapCreated: (controller) {
                _mapController = controller;
              },
              markers: {
                Marker(
                  markerId: MarkerId("source"),
                  position: _sourceLatLng,
                ),
                Marker(
                  markerId: MarkerId("destination"),
                  position: _destinationLatLng,
                ),
              },
            ),

          )
           
          ,
          Positioned(
          
          top: xheight*.46,
            child: Container(
            height: xheight*.54,
            width: xwidth,
            decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255),

borderRadius: BorderRadius.only(topLeft: Radius.circular(
  30
),topRight: Radius.circular(30))



            ),
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(children: [
            
            SizedBox(height: xheight*.03,),
            



MapAutoCompleteField(

            googleMapApiKey: apiKey,
            controller: srcctl,
            itemBuilder: (BuildContext context, suggestion) {
              return ListTile(
                title: Text(suggestion.description),
              );
            },
            onSuggestionSelected: (suggestion) {
              srcctl.text = suggestion.description;
              print(suggestion);
            },
          
            inputDecoration: const InputDecoration(
              hintText: "Pick Up Point",
              prefixIcon: Icon(Icons.location_pin,color: Color(0xff0c50b4),)
            ),
            
            )
            ,
            const SizedBox(height: 10,),
MapAutoCompleteField(

            googleMapApiKey: apiKey,
            controller: srcctl,
            itemBuilder: (BuildContext context, suggestion) {
              return ListTile(
                title: Text(suggestion.description),
              );
            },
            onSuggestionSelected: (suggestion) {
              srcctl.text = suggestion.description;
            },
          
            inputDecoration: const InputDecoration(
              hintText: "Destination Point",
              prefixIcon: Icon(Icons.location_pin,color: Color(0xff0c50b4),)
            ),
            
            )
            ,
            const SizedBox(height: 10,),

            TextField(

decoration: InputDecoration(hintText: "Product Type",prefixIcon: Icon(Icons.shopping_cart,color: Color(0xff0c50b4))),
            ),

                        const SizedBox(height: 10,),

            TextField(
            controller: _controllerdx,
           onTap: (){_selectDate(context);
                  },
decoration: InputDecoration(prefixIcon: Icon(Icons.calendar_month_outlined,color: Color(0xff0c50b4)),
hintText: "PickUp date"
),

            )
,
            const SizedBox(height: 10,),

TextField(
  keyboardType: TextInputType.number,
  decoration: InputDecoration(
    hintText: "Offer Your Fare",
    prefixIcon: Icon( Icons.currency_rupee,color: Color(0xff0c50b4),
  
  
  )),
  
)
            
            ,

            Expanded(child: SizedBox()),

 Container(
              padding: const EdgeInsets.only(right: 10,left: 10,bottom: 10),
              height: 60,
              width: xwidth,
              child: ElevatedButton(
                onPressed: () {

                
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0D6EFD),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: const Text("Find Driver", style: TextStyle(fontSize: 20)),
              ),
            ),
            
            
            ],),
            )
          ))




        ]
)

);
  }

}

