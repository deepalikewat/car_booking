import 'package:car_booking/driver_profile.dart';
import 'package:car_booking/profile.dart';
import 'package:car_booking/rough.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//raju


class L_4 extends StatefulWidget {

 @override
  State<L_4> createState() => Rloginxz();


}







class Rloginxz extends State<L_4> {

 
 












   var isbtnpgrs=false;


 Future<void> drf_login(BuildContext context,int user_type) async {
   
   setState(() {
         isbtnpgrs=true;

   });

   
   
      final SharedPreferences prefs = await SharedPreferences.getInstance();

   
    try {
      
   
    final dc = await http.post(
        Uri.parse("https://admin.returnlorry.com/appservice/setusertype"),
        body: json.encode(
        
{
    "Token": prefs.getString("Token"),
    "userId": prefs.getString("userId"),
    "userPhone": prefs.getString("userPhone"),
    "userType": "$user_type"
}

        ));

    


    final rc = json.decode(dc.body);

  

await prefs.setString("userType","$user_type");

ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(rc["data"]["msg"]),backgroundColor: Colors.blueGrey,));




    // print(rc);
    // print(rc["name"]);
    // setState(() {

 // ignore: use_build_context_synchronously

 // ignore: use_build_context_synchronously
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                           
                           if(user_type==1){
                          return  Profile();
                           
                           }else{
                           return  Driver();
                           }

                         },));


     // ignore: empty_catches
     } catch (e) {
      
         print(e);

    }
  }

  @override
  Widget build(BuildContext context) {
    double xheight = MediaQuery.of(context).size.height;
    double xwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(children: [
          // Padding(padding: EdgeInsets.only()),
          Column(children: [
            Image(
              image: const AssetImage("img/truck.png"),
              fit: BoxFit.fill,
              width: xwidth,
              height: xheight *.5,
            ),
             Padding(padding: EdgeInsets.only(top: xheight*.02)),
            const Text(
              "Are You a Passenger",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xff000000)),
            ),
            const Text(
              "or a Driver",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xff000000)),
            ),
             Padding(padding: EdgeInsets.only(top:  xheight*.02)),
            const Text(
              "You can change the mode",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff7D848D)),
            ),


const Expanded(child: Text("")),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              width: xwidth,
              child: ElevatedButton(
                onPressed: () {
                  drf_login(context, 1);

                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                           
                  //          return Profile();
                           

                  //        },));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0D6EFD),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: const Text("Passenger", style: TextStyle(fontSize: 20)),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              width: xwidth,
              child: ElevatedButton(
                onPressed: () {

drf_login(context, 2);
                
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0D6EFD),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: const Text("Driver", style: TextStyle(fontSize: 20)),
              ),
            ),
            const Expanded(child: Text("")),

          ],
          
          
          ),
        ]),
      ),
    );
  }
}
