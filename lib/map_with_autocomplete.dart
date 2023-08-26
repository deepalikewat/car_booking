import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart';
// import 'package:maps_places_autocomplete/maps_places_autocomplete.dart';
// import 'package:maps_places_autocomplete/model/place.dart';
// import 'package:maps_places_autocomplete/model/suggestion.dart';
import 'package:map_autocomplete_field/map_autocomplete_field.dart';



class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final apiKey ='AIzaSyDXLXII5-jnC-fJ5hSF3xc5ucf_O_ecOfQ';
  late LatLng _sourceLatLng;
  late LatLng _destinationLatLng;





  // _showPlacePicker(TextEditingController controller) async {
  //   Prediction? prediction = await PlacesAutocomplete.show(
  //     context: context,
  //     apiKey: 'YOUR_GOOGLE_MAPS_API_KEY',
  //   );

  //   if (prediction != null) {
  //     PlacesDetailsResponse details =
  //         await places.getDetailsByPlaceId(prediction.placeId!);
  //     double lat = details.result.geometry!.location.lat;
  //     double lng = details.result.geometry!.location.lng;
  //     LatLng latLng = LatLng(lat, lng);

  //     setState(() {
  //       controller.text = prediction.description!;
  //       if (controller == _sourceController) {
  //         _sourceLatLng = latLng;
  //         _mapController?.animateCamera(CameraUpdate.newLatLng(_sourceLatLng));
  //       } else {
  //         _destinationLatLng = latLng;
  //         _mapController?.animateCamera(CameraUpdate.newLatLng(_destinationLatLng));
  //       }
  //     });
  //   }
  // }

//   // void onSuggestionClick(Place placeDetails) {
//   //   print(placeDetails);
//   // }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Container(
            height: 200,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(21.1290, 82.7792),
                zoom: 15,
              ),
              onMapCreated: (controller) {
                _mapController = controller;
              },
              // markers: {
              //   Marker(
              //     markerId: MarkerId("source"),
              //     position: _sourceLatLng,
              //   ),
              //   Marker(
              //     markerId: MarkerId("destination"),
              //     position: _destinationLatLng,
              //   ),
              // },
            ),

          ),
          
        placesAutoCompleteTextField(),
        

          
          ElevatedButton(
            onPressed: () {

            },
            child: const Text("Calculate Distance"),
          ),
        ],
      ),
    );
  }


  placesAutoCompleteTextField() {
    return 
   
    SizedBox(
                    height: 90,
                    child: MapAutoCompleteField(
            googleMapApiKey: apiKey,
            controller: controller,
            itemBuilder: (BuildContext context, suggestion) {
              return ListTile(
                title: Text(suggestion.description),
              );
            },
            onSuggestionSelected: (suggestion) {
              controller.text = suggestion.description;
            },
          )
                    

    );
  }
}
