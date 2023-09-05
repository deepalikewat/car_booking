import 'dart:io';

import 'package:car_booking/UserDasboard.dart';
import 'package:car_booking/rloginn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => dix();
}

//gg
class dix extends State<Profile> {

String fileToBase64(File file) {
  List<int> imageBytes = file.readAsBytesSync();
  String base64String = base64Encode(imageBytes);
  return base64String;
}



Future<void> syncp() async{
  





}


@override
  void initState() {
    // TODO: implement initState
    syncp();
  }

  bool isbtnpgrs=false;
  File? _image;
  String drProfileImg="ABC XYZ";
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    print(pickedFile?.path);

    // File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  TextEditingController p_name = TextEditingController();
  TextEditingController p_num = TextEditingController();
  TextEditingController p_emailid = TextEditingController();
  TextEditingController p_addr = TextEditingController();

  // void dinc() {}
  Future<void> drf_profile() async {
 String base64String ="x";
  if (_image != null) {
     base64String = fileToBase64(_image!);
    print("Base64 encoded string:\n$base64String");
  } else {
    print("Image file is null.");
  }

setState(() {
  isbtnpgrs=true;
});
    final SharedPreferences prefs = await SharedPreferences.getInstance();

  
    final dc = await http.post(
        Uri.parse("https://admin.returnlorry.com/appservice/updateprofile"),
        body: json.encode(
        
{
      
  
    "Token": prefs.getString("Token"),
    "userId": prefs.getString("userId"),
    "userPhone": prefs.getString("userPhone"),
    "userType": prefs.getString("userType"),
    "name": p_name.text,
    "phone":  p_num.text,
    "email": p_emailid.text,
    "address": p_addr.text,
    "profile_image":"data:image/png;base64,$base64String "

}

        )
        
        );

    


   final rc = json.decode(dc.body);

  
  print(rc);

  final SharedPreferences pref = await SharedPreferences.getInstance();

  pref.setString("profile_image", rc["data"]["data"]["profile_image"]);
  pref.setString("name", rc["data"]["data"]["name"]);
  pref.setString("email", rc["data"]["data"]["email"]);
  pref.setString("address", rc["data"]["data"]["address"]);
  

  // ignore: use_build_context_synchronously
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Center( child: Text('${rc["data"]["msg"]}')),backgroundColor: Color.fromARGB(255, 26, 3, 89),));




// ignore: use_build_context_synchronously
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                           
                          return  const UserDashBoard();
                           

                         },));
                    





  }


  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;


    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(children: [
          SizedBox(
            height: xheight * .01,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text(""),
          //     const Text("Edit Profile",
          //         style: TextStyle(
          //             color: Color(0xff000000),
          //             fontSize: 28,
          //             fontWeight: FontWeight.bold)),
          //     TextButton(
          //       onPressed: () {},
          //       style: TextButton.styleFrom(
          //           // backgroundColor: const Color.fromARGB(255, 68, 44, 44),
          //           foregroundColor: Colors.blueAccent),
          //       child: const Text("Done"),
          //     ),
          //   ],
          // ),
      
          Padding(padding: EdgeInsets.only(top: xheight * 0.01)),
      
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
                      : kIsWeb? Image.network(_image!.path, width: 130,
                          height: 130,
                          fit: BoxFit.cover,): Image.file(
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
          const Padding(padding: EdgeInsets.only(top: 10)),
          // const Padding(padding: EdgeInsets.only(top: 20, bottom: 10)),
           Text(
            drProfileImg,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff1B1E28)),
          ),
      
           Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 10),
            child: TextButton( onPressed: () {
              
            }, child: const Text("Change Profile Picture",
              style: TextStyle(fontSize: 16, color: Color(0xff0D6EFD)),
            ),
          )),
      
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            width: xwidth *.9,
            child: const Text(
              "Full Name",
              style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
            ),
          ),
      
          Container(
            width: xwidth * .9,
            child: TextField(
              controller: p_name,
              onChanged: (value) {
                setState(() {
                  drProfileImg=value;
                });
              },
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                hintText: "name",
              ),
            ),
          ),
      
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 20),
            width: xwidth * .9,
            child: const Text(
              "Enter Number",
              style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
            ),
          ),
      
          Container(
            width: xwidth *.9,
            child: TextField(
              controller: p_num,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
        
                              prefixIcon:  Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text('+91') ),
              ),
              
            ),
          ),
      
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 20),
            width: xwidth *.9,
            child: const Text(
              "Email Id",
              style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
            ),
          ),
      
          Container(
            width: xwidth * .9,
            child: TextField(
              controller: p_emailid,
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
            width: xwidth *.9,
            child: const Text(
              "Enter Address",
              style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
            ),
          ),
      
          Container(
            width: xwidth * .9,
            child: TextField(
              controller: p_addr,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                hintText: "Enter Full Address",
              ),
            ),
          ),
          const Expanded(child: Text("")),
      
      
            SizedBox(
                        width: xwidth * .9,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                           
                          drf_profile();
                        
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
                                
                                Text("Please Wait") 
                            
                            ],
                          ):
                              const Text("Updates", style: TextStyle(fontSize: 20)),
                        ),
                      ),
      
      
          
          const SizedBox(
            height: 20,
          )
        ])),
      ),
    );
  }
}
