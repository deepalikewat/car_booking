import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart';
// import 'package:maps_places_autocomplete/maps_places_autocomplete.dart';
// import 'package:maps_places_autocomplete/model/place.dart';
// import 'package:maps_places_autocomplete/model/suggestion.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final apiKey = 'AIzaSyDXLXII5-jnC-fJ5hSF3xc5ucf_O_ecOfQ';
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

  // void onSuggestionClick(Place placeDetails) {
  //   print(placeDetails);
  // }

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
          // placesAutoCompleteTextField(),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Calculate Distance"),
          ),
        ],
      ),
    );
  }

  // placesAutoCompleteTextField() {
  //   return SizedBox(
  //     height: 40,
  //     child: MapsPlacesAutocomplete(
  //         mapsApiKey: apiKey,
  //         onSuggestionClick: onSuggestionClick,
  //         buildItem: (Suggestion suggestion, int index) {
  //           return Container(
  //               margin: const EdgeInsets.fromLTRB(2, 2, 2, 0),
  //               padding: const EdgeInsets.all(8),
  //               alignment: Alignment.centerLeft,
  //               color: Colors.white,
  //               child: Text(suggestion.description));
  //         },
  //         inputDecoration: const InputDecoration(
  //             contentPadding: EdgeInsets.all(8),
  //             border: OutlineInputBorder(
  //                 borderSide: BorderSide(color: Colors.white)),
  //             hintText: "Digite o endereço com número para melhorar a busca",
  //             errorText: null),
  //         clearButton: const Icon(Icons.close),
  //         componentCountry: 'br',
  //         language: 'pt-Br'),
  //   );
  // }
}
