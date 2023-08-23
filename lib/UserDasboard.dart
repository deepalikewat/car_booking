import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice_ex/places.dart';
import 'package:map_autocomplete_field/map_autocomplete_field.dart';


class UserDashBoard extends StatefulWidget {
  const UserDashBoard({super.key});

  @override

    State<UserDashBoard> createState() => UserDashBoardx();

}

class UserDashBoardx  extends State<UserDashBoard>{

  GoogleMapController? _mapController;
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final apiKey ='AIzaSyDXLXII5-jnC-fJ5hSF3xc5ucf_O_ecOfQ';
  late LatLng _sourceLatLng=const LatLng(21.1290, 82.7792);
  late LatLng _destinationLatLng=const LatLng(21.1280, 82.7792);
  TextEditingController controller = TextEditingController();
  final GoogleMapsPlaces _place = GoogleMapsPlaces(apiKey: "AIzaSyDXLXII5-jnC-fJ5hSF3xc5ucf_O_ecOfQ" );

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
                  markerId: const MarkerId("source"),
                  position: _sourceLatLng,
                ),
                Marker(
                  markerId: const MarkerId("destination"),
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
            onSuggestionSelected: (suggestion) async {
              srcctl.text = suggestion.description;


 
            },
          
            inputDecoration: const InputDecoration(
              hintText: "Destination Point",
              prefixIcon: Icon(Icons.location_pin,color: Color(0xff0c50b4),)
            ),
            
            )
            ,
            const SizedBox(height: 10,),

            const TextField(

decoration: InputDecoration(hintText: "Product Type",prefixIcon: Icon(Icons.shopping_cart,color: Color(0xff0c50b4))),
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

const TextField(
  keyboardType: TextInputType.number,
  decoration: InputDecoration(
    hintText: "Offer Your Fare",
    prefixIcon: Icon( Icons.currency_rupee,color: Color(0xff0c50b4),
  
  
  )),
  
)
            
            ,

            const Expanded(child: SizedBox()),

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

