import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';



class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  TextEditingController _sourceController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  final apiKey ='AIzaSyDXLXII5-jnC-fJ5hSF3xc5ucf_O_ecOfQ';
  late LatLng _sourceLatLng;
  late LatLng _destinationLatLng;

  @override
  void initState() {
    super.initState();
  }



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
          
          GooglePlaceAutoCompleteTextField(
        textEditingController: controller,
        googleAPIKey: "YOUR_GOOGLE_API_KEY",
        inputDecoration: InputDecoration(),
        debounceTime: 800, // default 600 ms,
        countries: ["in","fr"],// optional by default null is set
        isLatLngRequired:true,// if you required coordinates from place detail
        getPlaceDetailWithLatLng: (Prediction prediction) {
         // this method will return latlng with place detail
        print("placeDetails" + prediction.lng.toString());
        }, // this callback is called when isLatLngRequired is true
        itemClick: (Prediction prediction) {
         controller.text=prediction.description!;
          controller.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
        },
        // if we want to make custom list item builder
        itemBuilder: (context, index, Prediction prediction) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(
                  width: 7,
                ),
                Expanded(child: Text("${prediction.description??""}"))
              ],
            ),
          );
        },
        // if you want to add seperator between list items
        seperatedBuilder: Divider(),
        // want to show close icon 
        isCrossBtnShown: true,
         
         
        
        
    ),
          
          ElevatedButton(
            onPressed: () {

            },
            child: const Text("Calculate Distance"),
          ),
        ],
      ),
    );
  }
}
