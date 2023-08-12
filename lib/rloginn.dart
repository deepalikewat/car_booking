import 'dart:math';

import 'package:flutter/material.dart';

class RLogin extends StatefulWidget {
  const RLogin();

  @override
  State<RLogin> createState() => Rloginx();
}

// https://admin.returnlorry.com/appservice/otp{
//     "userPhone": "9831166884",
//     "deviceKey":"durLHMKZShKUM9EFmy8mnW:APA91bEe9ptlVoy9sGyFK0n97X135PS4R2vAJ60f-LKKOSTX9H_yQVu4jnoSOmMrkOUX7qbPqWIcXl4A5PqOW1hr-Tu1bCbNOtYf6QhhZc9jUNIY4eMJKSG2oQ1JUPnyIswX6AD21MpH"
// }
class Rloginx extends State<RLogin> {
  @override
  Widget build(BuildContext context) {
   
   double xwidth = MediaQuery.of(context).size.width;
     double xheight = MediaQuery.of(context).size.height;


   return   Scaffold(
    
backgroundColor: Color.fromARGB(0, 104, 138, 182),

    body: SafeArea(child:Padding(padding: EdgeInsets.all(xheight*.03), child: Center(child: Column(
      children: [

        Padding(padding: EdgeInsets.only(top: xheight*.14,bottom: 10),
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


Padding(padding: EdgeInsets.all(xwidth*.05)),
TextField(decoration: InputDecoration(
  
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Color.fromARGB(255, 108, 105, 105)

),
)

)
)

,
Padding(padding: EdgeInsets.only(top: 40),
child: Text("We Will Sent you an OTP on This Mobile\nNumber to verify.",textAlign: TextAlign.center, style: TextStyle(fontSize: 18,color: Color(0xff7D848D))),

)
,
Expanded(child:Text("")),

Container(


width: xwidth*9,
height: 50,
              child: 

               ElevatedButton(
                
                onPressed: () {},
                child: const Text("Driver", style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0D6EFD),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
              



            ),

    ],)
    ))
    )
    
    );
    




   

  }
 
 


}