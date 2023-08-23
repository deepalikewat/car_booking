import 'package:car_booking/sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'otp_verify.dart';

class RLogin extends StatefulWidget {
  const 
  RLogin({super.key});

  @override
  State<RLogin> createState() => Rloginx();
}

// https://admin.returnlorry.com/appservice/otp{
//     "userPhone": "9831166884",
//     "deviceKey":"durLHMKZShKUM9EFmy8mnW:APA91bEe9ptlVoy9sGyFK0n97X135PS4R2vAJ60f-LKKOSTX9H_yQVu4jnoSOmMrkOUX7qbPqWIcXl4A5PqOW1hr-Tu1bCbNOtYf6QhhZc9jUNIY4eMJKSG2oQ1JUPnyIswX6AD21MpH"
// }

class Rloginx extends State<RLogin> {
  TextEditingController rsign = TextEditingController();

bool isbtnpgrs=false;

  // void dinc() {}
  // ignore: non_constant_identifier_names
  Future<void> drf_login(BuildContext context) async {
   
   setState(() {
         isbtnpgrs=true;

   });
   
   
    try {
      
   
    final dc = await http.post(
        Uri.parse("https://admin.returnlorry.com/appservice/otp"),
        body: json.encode({
          "userPhone": rsign.text,
          "deviceKey":
              "durLHMKZShKUM9EFmy8mnW:APA91bEe9ptlVoy9sGyFK0n97X135PS4R2vAJ60f-LKKOSTX9H_yQVu4jnoSOmMrkOUX7qbPqWIcXl4A5PqOW1hr-Tu1bCbNOtYf6QhhZc9jUNIY4eMJKSG2oQ1JUPnyIswX6AD21MpH"
        }));

    // final dc = await http.get(Uri.parse("http://127.0.0.1"));

    final rc = json.decode(dc.body);

    print(dc.body);
    // print(rc);
    // print(rc["name"]);
    // setState(() {

 // ignore: use_build_context_synchronously


 if (mounted){
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(rc["data"]["msg"]),backgroundColor: Colors.indigo,));

 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                           
                           return  OtpVeri(otp: rc["data"]["data"]["otp"],userPhone: rsign.text,);
                           

                         },));
    // });
 }

     // ignore: empty_catches
     } catch (e) {
      
      
    }
  }

  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;

void optgo() {
  
  
}

    

    return Scaffold(
        backgroundColor: const Color.fromARGB(0, 104, 138, 182),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(xheight * .03),
                child: Center(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: xheight * .14, bottom: 10),
                      child: const Text(
                        "Sign in now",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1B1E28)),
                      ),
                    ),
                    const Text(
                      "Please sign in to continue our app",
                      style: TextStyle(color: Color(0xff7D848D), fontSize: 20),
                    ),
                    Padding(padding: EdgeInsets.all(xwidth * .05)),
                    SizedBox(
                      height: 60,
                      width: xheight*.8,
                      child: TextField(
                          controller: rsign,
                          decoration: const InputDecoration(
                                
                            prefixIcon:  Padding(
                                padding: EdgeInsets.all(15),
                                child: Text('+91  ') ),
                            // label: Text(
                            //   "Enter Your Phone Number",
                            //   textAlign: TextAlign.center,
                            //   style:  TextStyle(color: Colors.grey),
                            // ),
                            hintText: "Enter Your Phone Number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              )
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(15),
                              //   borderSide:  BorderSide(
                              //       color: Color.fromARGB(255, 108, 105, 105)),
                              
                              
                              // )
                              
                              )
                              
                              ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                          "We Will Sent you an OTP on This Mobile\nNumber to verify.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, color: Color(0xff7D848D))),
                    ),
                    const Expanded(child: Text("")),
                    SizedBox(
                      width: xwidth * .9,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                         
                       drf_login(context);
                       
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
                            const Text("Next", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                )))));
  }
}
