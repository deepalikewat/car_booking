import 'dart:io';

import 'package:car_booking/DriverDashboard.dart';
import 'package:car_booking/UploadDashboard.dart';
import 'package:car_booking/upload.dart';
import 'package:car_booking/uploadx.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Owner extends StatefulWidget {

Map<String, String> driverx;

  Owner({super.key, required this.driverx});







  @override
  State<Owner> createState() => rix();
}

//gg
class rix extends State<Owner> {
  File? _image;
  final picker = ImagePicker();
  
  bool isbtnpgrsx=false;
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    print(pickedFile?.path);
    // File image = await ImagePicker.pickImage(source: ImageSource.gallery);
   
   



  final SharedPreferences prefs = await SharedPreferences.getInstance();

   if (pickedFile != null) {
    final dc = await http.post(
        Uri.parse("https://admin.returnlorry.com/appservice/uploadphoto"),
        body: json.encode(
        
{
      
  
    "Token": prefs.getString("Token"),
    "userId": prefs.getString("userId"),
    "userPhone": prefs.getString("userPhone"),
    "userType": prefs.getString("userType"),
    "imagetype":"owner_photo",
     "image": "data:image/png;base64,${fileToBase64(File(pickedFile.path))}"
  




   
           }     ));

         await prefs.setString("owner_photo",jsonDecode(dc.body)["data"]["data"]["owner_photo"]);


print(prefs.getKeys());
   }



   
   
    setState(() {
      if (pickedFile != null) {



        _image = File(pickedFile.path);


        
      } else {
        
        print('No image selected');
      }
    });
  }


  //rsuj

  TextEditingController o_name = TextEditingController();
  TextEditingController o_num = TextEditingController();
  TextEditingController o_emailid = TextEditingController();
  TextEditingController o_addr = TextEditingController();
  TextEditingController o_adhar = TextEditingController();


String fileToBase64(File file) {
  List<int> imageBytes = file.readAsBytesSync();
  String base64String = base64Encode(imageBytes);
  return base64String;
}
  // void dinc() {}
  Future<void> drf_owner() async {
    final datax = json.encode({
      // "driver_driving_license_no": o_license.text,
      
    });
   
   setState(() {
         isbtnpgrsx=true;

   });
   
   
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

   
    final dc = await http.post(
        Uri.parse("https://admin.returnlorry.com/appservice/updateprofile"),
        body: json.encode({
    
    "Token": prefs.getString("Token"),
    "userId": prefs.getString("userId"),
    "userPhone": prefs.getString("userPhone"),
    "userType": prefs.getString("userType"),


    "owner_name": o_name.text,
      "owner_phone": o_num.text,
      "owner_email": o_emailid.text,
      "owner_address": o_addr.text,
      "owner_aadhar_no": o_adhar.text,
    "vehicle_no": "WB7564HG5",
    "vehicle_type": 1,
    "vehicle_source_pincode": "731224",
    "transport_year": "2014",
    "driver_name": widget.driverx["driver_name"],
    "driver_phone": widget.driverx["driver_phone"],
    "driver_email": widget.driverx["driver_email"],
    "driver_dob": widget.driverx["driver_dob"],
    "driver_aadhar_no": widget.driverx["driver_aadhar_no"],
    "driver_driving_license_no": widget.driverx["driver_driving_license_no"]


         
        }));

         await  prefs.setString("driver_name",widget.driverx["driver_name"]??"Return Lorry");
         await  prefs.setString("driver_email",widget.driverx["driver_email"]??"driver@returnlorry.com");

 // ignore: use_build_context_synchronously
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                           
                        
                        return UploadDashboard();
                         },));


    }catch(rtd){
      print(rtd);
    }

  }


  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(child:  Center(
          child: Column(children: [
        SizedBox(
          height: xheight * .02,
        ),
        const Text(
          "Owner Pofile",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xff1B1E28)),
        ),
        Padding(padding: EdgeInsets.only(top: xheight * 0.03)),
        Container(
          height: 130,
          width: 130,
          child: Stack(children: [
            ClipOval(
                child: _image == null
                    ? const Image(
                        image: AssetImage("img/QT.jpeg"),
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        _image!,
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      )),
            Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    getImage();
                  },
                ))
          ]),
        ),
        SizedBox(
          height: xheight * .01,
        ),
        Padding(padding: EdgeInsets.only(top: xheight * 0.03)),
        const Padding(padding: EdgeInsets.only(top: 20)),
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          width: xwidth - 70,
          child: const Text(
            "Full  Name",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),
        Container(
          width: xwidth - 60,
          child: TextField(
            controller: o_name,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "namr",
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 8, top: 20),
          width: xwidth - 70,
          child: const Text(
            "Enter Number",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),
        Container(
          width: xwidth - 60,
          child: TextField(
            controller: o_num,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "+91",
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 8, top: 20),
          width: xwidth - 70,
          child: const Text(
            "Email Id",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),
        Container(
          width: xwidth - 60,
          child: TextField(
            controller: o_emailid,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "Driver@gmial.com",
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 8, top: 20),
          width: xwidth - 70,
          child: const Text(
            "Full Address",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          width: xwidth - 60,
          child: TextField(
            controller: o_addr,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "Enter Full Address",
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 8, top: 20),
          width: xwidth - 70,
          child: const Text(
            "Aadhar Card Number",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),
        Container(
          // padding: const EdgeInsets.only(bottom: ),
          width: xwidth - 60,
          child: TextField(
            controller: o_adhar,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "000 000 000 000 00",
            ),
          ),
        ),
const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 60,
          width: xwidth,
          child: ElevatedButton(
            onPressed: () {

drf_owner();

         },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0D6EFD),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            child: const Text(
              "Next",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ])),
    ));
  }
}
