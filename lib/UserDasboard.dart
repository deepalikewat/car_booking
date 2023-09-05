import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice_ex/places.dart' as plasex;
import 'package:map_autocomplete_field/map_autocomplete_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserDashBoard extends StatefulWidget {
  const UserDashBoard({super.key});

  @override
  State<UserDashBoard> createState() => UserDashBoardx();
}

class UserDashBoardx extends State<UserDashBoard> {
  GoogleMapController? _mapController;
  Set<Polyline> _polylines = {};









Map<PolylineId, Polyline> _mapPolylines = {};
int _polylineIdCounter = 1;

List<LatLng> _createPoints() {
  final List<LatLng> points = <LatLng>[];
  points.add(const LatLng(1.875249, 0.845140));
  points.add(const LatLng(4.851221, 1.715736));
  points.add(const LatLng(8.196142, 2.094979));
  points.add(const LatLng(12.196142, 3.094979));
  points.add(const LatLng(16.196142, 4.094979));
  points.add(const LatLng(20.196142, 5.094979));
  return points;
}
void _add() {
  final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
  _polylineIdCounter++;
  final PolylineId polylineId = PolylineId(polylineIdVal);

  final Polyline polyline = Polyline(
    polylineId: polylineId,
    consumeTapEvents: true,
    color: Colors.red,
    width: 5,
    points: _createPoints(),
  );

  setState(() {
    _mapPolylines[polylineId] = polyline;
  });
}






  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final apiKey = 'AIzaSyDXLXII5-jnC-fJ5hSF3xc5ucf_O_ecOfQ';
  LatLng _sourceLatLng = const LatLng(21.1290, 82.7692);
  late LatLng _destinationLatLng = const LatLng(21.1280, 82.7792);
  TextEditingController controller = TextEditingController();
  final plasex.GoogleMapsPlaces _places = plasex.GoogleMapsPlaces(
      apiKey: "AIzaSyDXLXII5-jnC-fJ5hSF3xc5ucf_O_ecOfQ");

  TextEditingController srcctl = TextEditingController();
  TextEditingController srcctlx = TextEditingController();
  TextEditingController producttype = TextEditingController();
  TextEditingController offerfare = TextEditingController();
  TextEditingController distancef = TextEditingController();

  final TextEditingController _controllerdx = TextEditingController();
<<<<<<< HEAD
=======
  
  bool showsidex=false;
  double rxt=0.0;
  String distance="";
  
  bool isbtnpgrs=false;
  String spincode="0";
  String dpincode="0"; 
  String saddr="";
  String daddr="";
  
  
>>>>>>> 7f9b99b (lp)

  bool showsidex = false;
  double rxt = 0.0;
  String distance = "";

  bool isbtnpgrs = false;
  String spincode = "0";
  String dpincode = "0";
  String saddr = "";
  String daddr = "";

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
      _controllerdx.text = formattedDate.toString();
    }
  }

  void _addPolyline() {
    setState(() {
      _polylines.add(Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.blue,
        points: [_sourceLatLng, _destinationLatLng],
      ));
    });

    LatLngBounds bounds = LatLngBounds(
<<<<<<< HEAD
      southwest: LatLng(
        _sourceLatLng.latitude < _destinationLatLng.latitude
            ? _sourceLatLng.latitude
            : _destinationLatLng.latitude,
        _sourceLatLng.longitude < _destinationLatLng.longitude
            ? _sourceLatLng.longitude
            : _destinationLatLng.longitude,
      ),
      northeast: LatLng(
        _sourceLatLng.latitude >= _destinationLatLng.latitude
            ? _sourceLatLng.latitude
            : _destinationLatLng.latitude,
        _sourceLatLng.longitude >= _destinationLatLng.longitude
            ? _sourceLatLng.longitude
            : _destinationLatLng.longitude,
      ),
    );

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _mapController?.animateCamera(
    //     CameraUpdate.newLatLngBounds(
    //       bounds,
    //       100.0,
    //     ),
    //   );
    // });
=======
    southwest: LatLng(
      _sourceLatLng.latitude < _destinationLatLng.latitude ? _sourceLatLng.latitude : _destinationLatLng.latitude,
      _sourceLatLng.longitude < _destinationLatLng.longitude ? _sourceLatLng.longitude : _destinationLatLng.longitude,
    ),
    northeast: LatLng(
      _sourceLatLng.latitude >= _destinationLatLng.latitude ? _sourceLatLng.latitude : _destinationLatLng.latitude,
      _sourceLatLng.longitude >= _destinationLatLng.longitude ? _sourceLatLng.longitude : _destinationLatLng.longitude,
    ),
  );

    _mapController?.animateCamera(

      CameraUpdate.newLatLngBounds(
        bounds,
        100.0,
        
      ),
    );
  
    
>>>>>>> 7f9b99b (lp)
  }

  Future<void> calculateDistance() async {
    String origin =
        '${_sourceLatLng.latitude},${_sourceLatLng.longitude}'; // Replace with your origin coordinates
    String destination =
        '${_destinationLatLng.latitude},${_destinationLatLng.longitude}'; // Replace with your destination coordinates

    String url =
        'https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=$origin&destinations=$destination&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      dynamic meters = data['rows'][0]['elements'][0]['distance']['value'];
      setState(() {
        distance = "$meters";
        print("totaldistance is $meters");

        distancef.text = "$meters";
      });
    }
  }

  Future<Map<String, dynamic>?> getPlaceDetails(String placeid) async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeid&key=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        final result = data['result'];

        final geometry = result['geometry'];
        final location = geometry['location'];
        final latitude = location['lat'];
        final longitude = location['lng'];

<<<<<<< HEAD
        String postalCode = '';
        final addressComponents = result['address_components'];
=======
      String postalCode = '';
      final addressComponents = result['address_components'];
      for (var component in addressComponents) {
        final types = List<String>.from(component['types']);
        if (types.contains('postal_code')) {
          postalCode = component['long_name'];
          break;
        }
      }

      if (postalCode.isEmpty) {
        final nearestPostalCode = await findNearestPostalCode(latitude, longitude);
        return {'latitude': latitude, 'longitude': longitude, 'postalCode': nearestPostalCode};
      }

      return {'latitude': latitude, 'longitude': longitude, 'postalCode': postalCode};
    }
  }
  return null;
}

Future<String?> findNearestPostalCode(double latitude, double longitude) async {
  final response = await http.get(Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == 'OK') {
      final results = data['results'];
      if (results.isNotEmpty) {
        final addressComponents = results[0]['address_components'];
>>>>>>> 7f9b99b (lp)
        for (var component in addressComponents) {
          final types = List<String>.from(component['types']);
          if (types.contains('postal_code')) {
            postalCode = component['long_name'];
            break;
          }
        }

        if (postalCode.isEmpty) {
          final nearestPostalCode =
              await findNearestPostalCode(latitude, longitude);
          return {
            'latitude': latitude,
            'longitude': longitude,
            'postalCode': nearestPostalCode
          };
        }

        return {
          'latitude': latitude,
          'longitude': longitude,
          'postalCode': postalCode
        };
      }
    }
    return null;
  }

  Future<String?> findNearestPostalCode(
      double latitude, double longitude) async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey'));

    print("find near code");
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        final results = data['results'];
        if (results.isNotEmpty) {
          final addressComponents = results[0]['address_components'];
          for (var component in addressComponents) {
            final types = List<String>.from(component['types']);
            if (types.contains('postal_code')) {
              return component['long_name'];
            }
          }
        }
      }
    }
    return null;
  }

  double mkdble(dynamic value) {
    double doubleValue;
    if (value is double) {
      doubleValue = value;
    } else if (value is int) {
      doubleValue = value.toDouble();
    } else if (value is String) {
      doubleValue = double.tryParse(value) ?? 0.0;
    } else {
      doubleValue = 0.0;
    }

    return doubleValue;
  }

  Future<void> createbooking() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    print(json.encode({
      "Token": prefs.getString("Token"),
      "userId": prefs.getString("userId"),
      "userPhone": prefs.getString("userPhone"),
      "userType": prefs.getString("userType"),
      "pick_up_point_lat": "${_sourceLatLng.latitude}",
      "pick_up_point_long": "${_sourceLatLng.longitude}",
      "pick_up_point_pincode": "$spincode",
      "pick_up_point_address": saddr,
      "destination_lat": "${_destinationLatLng.latitude}",
      "destination_long": "${_destinationLatLng.longitude}",
      "destination_pincode": "$dpincode",
      "destination_address": daddr,
      "vehicle_type_id": 1,
      "material_weight": "2000",
      "material_type": producttype.text,
      "distance": distancef.text,
      "calculated_price": distancef.text,
      "booking_date": _controllerdx.text
    }));
    if (isbtnpgrs) {
      return;
    }

<<<<<<< HEAD
    setState(() {
      isbtnpgrs = true;
    });
=======


if(isbtnpgrs){
  return ;
}

setState(() {
  isbtnpgrs=true;
});



>>>>>>> 7f9b99b (lp)

    final dc = await http.post(
<<<<<<< HEAD
        Uri.parse(
            "https://admin.returnlorry.com/appservice/createbookingrequest"),
        body: json.encode({
          "Token": prefs.getString("Token"),
          "userId": prefs.getString("userId"),
          "userPhone": prefs.getString("userPhone"),
          "userType": prefs.getString("userType"),
          "pick_up_point_lat": "${_sourceLatLng.latitude}",
          "pick_up_point_long": "${_sourceLatLng.longitude}",
          "pick_up_point_pincode": "$spincode",
          "pick_up_point_address": saddr,
          "destination_lat": "${_destinationLatLng.latitude}",
          "destination_long": "${_destinationLatLng.longitude}",
          "destination_pincode": "$dpincode",
          "destination_address": daddr,
          "vehicle_type_id": 1,
          "material_weight": "2000",
          "material_type": producttype.text,
          "distance": distancef.text,
          "calculated_price": distancef.text,
          "booking_date": _controllerdx.text
        }));
=======
        Uri.parse("https://admin.returnlorry.com/appservice/createbookingrequest"),
        body: json.encode(
          
{
    "Token": prefs.getString("Token"),
    "userId": prefs.getString("userId"),
    "userPhone": prefs.getString("userPhone"),
    "userType": prefs.getString("userType"),
    "pick_up_point_lat": "${_sourceLatLng.latitude}",
    "pick_up_point_long": "${_sourceLatLng.longitude}",
    "pick_up_point_pincode": "$spincode",
    "pick_up_point_address": saddr,
    "destination_lat": "${_destinationLatLng.latitude}",
    "destination_long": "${_destinationLatLng.longitude}",
    "destination_pincode": "$dpincode",
    "destination_address": daddr,
    "vehicle_type_id": 1,
    "material_weight": "2000",
    "material_type": producttype.text,
    "distance": distancef.text,
    "calculated_price": distancef.text ,
    "booking_date": _controllerdx.text
}



        ));



 ScaffoldMessenger.of(context).showSnackBar( SnackBar(duration: const Duration(seconds: 5), content: Text("${jsonDecode(dc.body)?['data']['msg']}"),backgroundColor: Colors.green,));


setState(() {
  isbtnpgrs=false;
});





}

















>>>>>>> 000f5e0 (v)

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 5),
      content: Text("${jsonDecode(dc.body)?['data']['msg']}"),
      backgroundColor: Colors.green,
    ));

    setState(() {
      isbtnpgrs = false;
    });
  }

// @override
//   void initState() async{

//     final response = await http.get(Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey'));

//   }

  @override
  Widget build(BuildContext context) {
    double xheight = MediaQuery.of(context).size.height;
    double xwidth = MediaQuery.of(context).size.width;

<<<<<<< HEAD
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [const Text("data")],
      )),
      body: SingleChildScrollView(
          child: Stack(children: [
        Container(
          height: xheight * .5,
          child: GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(21.1290, 82.7792),
              zoom: 15,
=======



return  Scaffold(

drawer: Drawer(child: ListView(children: [const Text("data")],)),

body: SingleChildScrollView(child:   Stack(
        children: [
          Container(
            height: xheight*.5,
            child: GoogleMap(
              mapType: MapType.normal,
                zoomControlsEnabled: false,

      initialCameraPosition: const CameraPosition(target: LatLng(0, 0), zoom: 4.0),
      polylines: Set<Polyline>.of(_mapPolylines.values),

              // initialCameraPosition: const CameraPosition(
              //   target: LatLng(21.1290, 82.7792),
              //   zoom: 15,
              // ),

              onMapCreated: (controller) {
                _mapController = controller;
              },
              markers: {
                Marker(
                  markerId: const MarkerId("source"),
                  position: _sourceLatLng,
                ),
                Marker(
                  markerId: const MarkerId("destination"),
                  position: _destinationLatLng,
                  
                ),
              },
>>>>>>> 7f9b99b (lp)
            ),
<<<<<<< HEAD
            onMapCreated: (controller) {
              _mapController = controller;
              _addPolyline();
            },
            markers: {
              Marker(
                markerId: const MarkerId("source"),
                position: _sourceLatLng,
              ),
              Marker(
                markerId: const MarkerId("destination"),
                position: _destinationLatLng,
              ),
            },
          ),
        ),
        Column(
          children: [
            Padding(padding: EdgeInsets.only(top: xheight * .45)),
            Container(
                width: xwidth,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: xheight * .03,
                      ),
                      MapAutoCompleteField(
                        googleMapApiKey: apiKey,
                        controller: srcctlx,
                        itemBuilder: (BuildContext context, suggestion) {
                          return ListTile(
                            title: Text(suggestion.description),
                          );
                        },
                        onSuggestionSelected: (suggestion) async {
                          srcctlx.text = suggestion.description;

                          try {
                            final tg =
                                await getPlaceDetails(suggestion.placeId);

                            try {
                              LatLng rg = LatLng(mkdble(tg?["latitude"]),
                                  mkdble(tg?["longitude"]));
                              print("fuck you$rg");
                            } catch (rt) {
                              print("fuck you$rt");
                            }

                            setState(() {
                              print(
                                  "im goodboy ${tg?['latitude'].runtimeType}");
                              _sourceLatLng =
                                  LatLng(tg?["latitude"], tg?["longitude"]);

                              spincode = tg?["postalCode"];
                              saddr = suggestion.description;
                            });
=======

          )
           
          ,
   
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: xheight*.45)),
              Container(
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
                controller: srcctlx,
                itemBuilder: (BuildContext context, suggestion) {
                  return ListTile(
                    title: Text(suggestion.description),
                  );
                },
                onSuggestionSelected: (suggestion) async {
                  srcctlx.text = suggestion.description;

try{
                  
                  final tg=await getPlaceDetails(suggestion.placeId);

try{
LatLng rg=LatLng(mkdble( tg?["latitude"]), mkdble( tg?["longitude"]));
 print("fuck you$rg");
}catch(rt){

  print("fuck you$rt");
}

setState(() {
  
  print("im goodboy ${tg?['latitude'].runtimeType}");
 _sourceLatLng=LatLng( tg?["latitude"], tg?["longitude"]);

spincode=tg?["postalCode"];
saddr=suggestion.description;
  

});

await calculateDistance();

}catch(y){
print(y);

print("problem harddde$y");

}

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
                onSuggestionSelected: (suggestion) async {
                  srcctl.text = suggestion.description;




                 
     final tg=await getPlaceDetails(suggestion.placeId);

try{
LatLng rg=LatLng(mkdble( tg?["latitude"]), mkdble( tg?["longitude"]));

print("fuck you value$rg");

}catch(rt){

  print("fuck you$rt");
}


setState(() {
  
  daddr= suggestion.description;
  _destinationLatLng=LatLng(mkdble( tg?["latitude"]), mkdble( tg?["longitude"]));
dpincode=tg?["postalCode"];
  
});
try{
            await calculateDistance();

}catch(xd){

  print("problem harex$xd");
}
                },
              
                inputDecoration: const InputDecoration(
                  hintText: "Destination Point",
                  prefixIcon: Icon(Icons.location_pin,color: Color(0xff0c50b4),)
                ),
                
                )
                ,
                const SizedBox(height: 10,),

                 TextField(
                  controller: producttype,

decoration: const InputDecoration(hintText: "Product Type",prefixIcon: Icon(Icons.shopping_cart,color: Color(0xff0c50b4))),
                ),

                            const SizedBox(height: 10,),

                TextField(
                controller: _controllerdx,
               onTap: (){_selectDate(context);
                      },
decoration: const InputDecoration(prefixIcon: Icon(Icons.calendar_month_outlined,color: Color(0xff0c50b4)),
hintText: "PickUp date"
),

                )
,
                const SizedBox(height: 10,),

 TextField(
  keyboardType: TextInputType.number,
  controller: offerfare,
  decoration: const InputDecoration(
    hintText: "Offer Your Fare",
    prefixIcon: Icon( Icons.currency_rupee,color: Color(0xff0c50b4),
  
  
  )),
  
) , const SizedBox(height: 10,),

 TextField(
  controller: distancef,
  keyboardType: TextInputType.number,
  decoration: const InputDecoration(
    hintText: "Distance",
    prefixIcon: Icon( Icons.social_distance,color: Color(0xff0c50b4),
  
  
  )),
  
)
                
                ,

const SizedBox(height: 30,),

  SizedBox(
                      width: xwidth * .9,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                         
                        createbooking();
                      
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff0D6EFD),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        child:
                        isbtnpgrs? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(color: Colors.white,)),
                              
                              Text("     Please Wait")
                          
                          ],
                        ):
                            const Text("Find Driver", style: TextStyle(fontSize: 20)),
                      ),
                    ),

const SizedBox(height: 10,),



                
                ],),
                )
              ),
            ],
          )
>>>>>>> 000f5e0 (v)

                            await calculateDistance();
                          } catch (y) {
                            print(y);

                            print("problem harddde$y");
                          }
                        },
                        inputDecoration: const InputDecoration(
                            hintText: "Pick Up Point",
                            prefixIcon: Icon(
                              Icons.location_pin,
                              color: Color(0xff0c50b4),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MapAutoCompleteField(
                        googleMapApiKey: apiKey,
                        controller: srcctl,
                        itemBuilder: (BuildContext context, suggestion) {
                          return ListTile(
                            title: Text(suggestion.description),
                          );
                        },
                        onSuggestionSelected: (suggestion) async {
                          srcctl.text = suggestion.description;

                          final tg = await getPlaceDetails(suggestion.placeId);

                          try {
                            LatLng rg = LatLng(mkdble(tg?["latitude"]),
                                mkdble(tg?["longitude"]));

                            print("fuck you value$rg");
                          } catch (rt) {
                            print("fuck you$rt");
                          }

<<<<<<< HEAD
                          setState(() {
                            daddr = suggestion.description;
                            _destinationLatLng = LatLng(mkdble(tg?["latitude"]),
                                mkdble(tg?["longitude"]));
                            dpincode = tg?["postalCode"];
                          });
                          try {
                            await calculateDistance();
                          } catch (xd) {
                            print("problem harex$xd");
                          }
                        },
                        inputDecoration: const InputDecoration(
                            hintText: "Destination Point",
                            prefixIcon: Icon(
                              Icons.location_pin,
                              color: Color(0xff0c50b4),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: producttype,
                        decoration: const InputDecoration(
                            hintText: "Product Type",
                            prefixIcon: Icon(Icons.shopping_cart,
                                color: Color(0xff0c50b4))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _controllerdx,
                        onTap: () {
                          _selectDate(context);
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.calendar_month_outlined,
                                color: Color(0xff0c50b4)),
                            hintText: "PickUp date"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: offerfare,
                        decoration: const InputDecoration(
                            hintText: "Offer Your Fare",
                            prefixIcon: Icon(
                              Icons.currency_rupee,
                              color: Color(0xff0c50b4),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: distancef,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: "Distance",
                            prefixIcon: Icon(
                              Icons.social_distance,
                              color: Color(0xff0c50b4),
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: xwidth * .9,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            createbooking();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0D6EFD),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          child: isbtnpgrs
                              ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        )),
                                    Text("     Please Wait")
                                  ],
                                )
                              : const Text("Find Driver",
                                  style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )),
          ],
        ),
        IconButton.outlined(
            onPressed: () {
              setState(() {
                showsidex = !showsidex;
                print(showsidex);
              });
            },
            icon: const Icon(
              Icons.menu,
              size: 35,
            )),
      ])),
      resizeToAvoidBottomInset: true,
    );
=======
} , icon: const Icon(Icons.menu,size: 35,))
,

        ]
)

),
resizeToAvoidBottomInset: true,
);
>>>>>>> 000f5e0 (v)
  }
}
