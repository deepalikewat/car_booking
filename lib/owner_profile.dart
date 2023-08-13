import 'dart:io';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';

class Owner extends StatefulWidget {
  @override
  State<Owner> createState() => rix();
}

//gg
class rix extends State<Owner> {
  void dinc() {}


File? _image;
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

  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              const Padding(padding: EdgeInsets.only(top: 10)),
              const Text(
                "Owner Profile",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1B1E28)),
              ),
              Container(
                height: 130,
                width: 130,

                child: Stack(children: [
                   ClipOval(
                      child: _image.isNull?const Image(
                    image:AssetImage("img/QT.jpeg"),
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ):Image.network(_image!.path,
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                  )
                  
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                       
                  
                        
                        icon: const Icon(Icons.camera_alt,color: Colors.red,),
                        onPressed: () {

                          getImage();
                        },
                      ))

                  // child: Icon(

                  //   Icons.camera,
                  //   color: Color(0xff2EA7D4),
                  //   size: 30,
                  // ))
                ]),

                // child: const ClipOval(
                //     child: Image(
                //   image: AssetImage("img/QT.jpeg"),
                //   width: 100,
                //   height: 300,
                //   fit: BoxFit.cover,
                // )),
              ),

              
             
             
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
                child: const TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: "Cutest",
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
                child: const TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
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
                child: const TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
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
                child: const TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
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
                child: const TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: "000 000 000 000 00",
                  ),
                ),
              ),
              const Expanded(child: Text("")),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                width: xwidth,
                child: ElevatedButton(
                  onPressed: () {},
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
            ])
          ],
        ),
      ),
    );
  }
}
