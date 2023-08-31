import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UploadItem extends StatefulWidget{
  String lnnnk;
  String t1st;
  String t2nd;
  String t2txt;
  String t1txt;
  bool s2show;
  UploadItem( this.lnnnk, this.t1st, this.t2nd,this.t1txt,this.t2txt,this.s2show );

   @override
  State<UploadItem> createState() => UploadItemV();
}

class UploadItemV extends State<UploadItem> {
  bool fprog=true;
  bool sprog=true;
  File? fimg;
  File? bimg;


  
String fileToBase64(File file) {
  List<int> imageBytes = file.readAsBytesSync();
  String base64String = base64Encode(imageBytes);
  return base64String;
}

 final picker = ImagePicker();
  Future getImage(bool rt,String imagetype) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    print(pickedFile?.path);

    // File image = await ImagePicker.pickImage(source: ImageSource.gallery);


      if (pickedFile != null) {

setState(() {
  rt?fprog=false:sprog=false;

});



  final SharedPreferences prefs = await SharedPreferences.getInstance();

  
    final dc = await http.post(
        Uri.parse("https://admin.returnlorry.com/appservice/uploadphoto"),
        body: json.encode(
        
{
      
  
    "Token": prefs.getString("Token"),
    "userId": prefs.getString("userId"),
    "userPhone": prefs.getString("userPhone"),
    "userType": prefs.getString("userType"),
    "imagetype":imagetype,
     "image": "data:image/png;base64,${fileToBase64(File(pickedFile.path))}"
  




   
           }     ));



print(dc.body);





setState(() {
  rt?fimg= File(pickedFile.path) : bimg=File(pickedFile.path);


});






















      } else {
        print('No image selected');
      }

  }
  @override
  Widget build(BuildContext context) {
    
    
  return Scaffold( body:
                         Column(children: [
                            
                            const Padding(
                              padding: EdgeInsets.only(top: 20,bottom: 10),
                              child:   Text("Upload Documents",style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            
                             Text(widget.lnnnk),
                            const SizedBox(height: 20,)
                            ,
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 Column(
                                  
                                children: [
                                  InkWell(onTap: () {
                      
                          
                            getImage(true,widget.t1st);

                            
                                
                            
                                  }, child:  fimg!=null ? Image.file(fimg!,fit: BoxFit.fill,width:  334*.3):(fprog? Image.asset("img/doc1.png",fit: BoxFit.fill,width: 334*.3,height: 356*.3,):const Padding(
                                    padding: EdgeInsets.only(top:30),
                                    child: CircularProgressIndicator(color: Color.fromARGB(255, 45, 0, 159),),
                                  ))  ),
                             Text(fprog?"\n${widget.t1txt}":"", textAlign: TextAlign.center,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                
                                ],
                      ), if( widget.s2show) 
                       Column(
                                children: [
                                  InkWell(onTap: () {
                      
                          
                            getImage(false,widget.t2nd);

                            
                                
                            
                                  }, child:  bimg!=null ? Image.file(bimg!,fit: BoxFit.fill,width:  334*.3):(sprog? Image.asset("img/doc1.png",fit: BoxFit.fill,width: 334*.3,height: 356*.3,):const CircularProgressIndicator(color: Color.fromARGB(255, 45, 0, 159),))  ),
                             Text(sprog?"\n${widget.t2txt}":"", textAlign: TextAlign.center,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                                
                                ],
                      )
                      
                      
                     
                               ],
                             ),
                            
                            const Expanded(child: Text(""))
                            ,
                            ElevatedButton(onPressed: 
                            (){
                            
                              Navigator.pop(context);
                              fprog=true;
                            }, 
                            
                            style: ElevatedButton.styleFrom( 
                              
                              
                              backgroundColor: const Color(0xff0D6EFD), )
                            ,child: const SizedBox(
                              width: 200,
                              child: Text("Close" ,textAlign: TextAlign.center,) ))
                            
                            
                        ]
                        ));
  }

}



class UploadDashboard extends StatefulWidget {
  @override
  State<UploadDashboard> createState() => updash();
}

class updash extends State<UploadDashboard> {
  bool isbtnpgrs=false;
  


   void drf_login(BuildContext context, String lnnnk, {ftbtn="Font",bkbtn="Back",fttxt="Font",bttxt="Back",s2b=true}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
        
              return AlertDialog(
                  shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30),),
                  content: SizedBox(height: 300, child: UploadItem(lnnnk,ftbtn,bkbtn,fttxt,bttxt,s2b))
                    
                  );
            
            
        }
    );
   }

  @override
  Widget build(BuildContext context) {
     double xwidth = MediaQuery.of(context).size.width;

 

 return  Scaffold(

// backgroundColor: Colors.black,

body: Center(
  child:   Column(children: [
  
  
    const Padding(
      padding: EdgeInsets.only(top:50,bottom: 10),
      child: Text("Upload Documents",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
    )
,
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          
    Column(
      children: [
        InkWell(onTap: () {
          drf_login(context,"Driver Adhar Card",ftbtn: "driver_adhar_front_image",bkbtn: "driver_adhar_back_image");

        }, child: Image.asset("img/doc1.png",fit: BoxFit.fill,width: 334*.36,height: 356*.36,)),

        const Text("\nDriver\nAadher Card", textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
      ],
    ),


    Column(
      children: [
        InkWell(
          onTap: (){
                      drf_login(context,"Driving License",ftbtn: "driver_driving_license_front_image",bkbtn: "driver_driving_license_back_image");

          },
          child: Image.asset("img/doc2.png",fit: BoxFit.fill,width: 334*.36,height: 356*.36,)),
        const Text("\nDriving\nLicense", textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)

      ],
    ),

    Column(
      children: [
        InkWell(
          onTap: () {
                                  drf_login(context,"Owner Adhar Card",ftbtn: "owner_aadhar_front_image",bkbtn: "owner_aadhar_back_image",);

          },
          child: Image.asset("img/doc3.png",fit: BoxFit.fill,width: 334*.36,height: 356*.36,)),
        const Text("\nOwner\nAadher Card", textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)

      ],
    ),

    
    
      ],),
      const SizedBox(height: 20,),
     Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
   
      Column(
        children: [
          InkWell(onTap: () {
                                                    drf_login(context,"Vehicle Photo",ftbtn: "vehicle_photo",bkbtn: "owner_aadhar_back_image", fttxt: "Full Photo",s2b: false);

          }, child: Image.asset("img/doc1.png",fit: BoxFit.fill,width: 334*.36,height: 356*.36,)),
          const Text("\nVehicle\nPhoto", textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
        ],
      
    ),


    InkWell(
      onTap: () {

        drf_login(context,"Vehicle Insurance",ftbtn: "vehicle_insurance_image",bkbtn: "registration_certificate_front_image",fttxt: "Front page",bttxt: "2nd page",s2b: false);

      },
      child: Column(
        children: [
          Image.asset("img/doc2.png",fit: BoxFit.fill,width: 334*.36,height: 356*.36,),
          const Text("\nVehicle\nInsurance", textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
    
        ],
      ),
    ),

    InkWell(
      onTap: () {
                drf_login(context,"Permit Photo",ftbtn: "permit_part_a_image",bkbtn: "permit_part_b_image",fttxt: "1st page",bttxt: "2nd page",s2b: true);

      },
      child: Column(
        children: [
          Image.asset("img/doc3.png",fit: BoxFit.fill,width: 334*.36,height: 356*.36,),
          const Text("\nPermit\nParts Photo", textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
    
        ],
      ),
    ),

    
    
      ],),


const Expanded(child: Text(""))
,
 SizedBox(
                      width: xwidth * .9,
                      height: 60,
                      child: ElevatedButton( 
                        
                        
                        onPressed: () {
                         

 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                           
                           return  VerificationScreen();

                         },));


                        },
    // });                        },
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
                            const Text("Next", style: TextStyle(fontSize: 20)),
                      ),
                    ),
  

const SizedBox(height: 10,)

  ]),
),

 );


  }
  



}




class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _rotation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _scale = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scale.value,
                  child: Transform.rotate(
                    angle: _rotation.value * 6.283, 
                    child: const Icon(
                      Icons.hourglass_empty,
                      size: 100,
                      color: Colors.blue,
                    ),
                  ),
                );
              },
            ),
            const Text(
              'Your Request is Under Verification',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "We will connect you once it's complete.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

