import 'dart:async';
import 'dart:convert';


import 'package:car_booking/front.dart';
import 'package:car_booking/lorry.dart';
import 'package:car_booking/rloginn.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class OtpVeri extends StatefulWidget {
  int otp=0;
  
  String userPhone;
    OtpVeri({required this.otp,required this.userPhone,super.key});

  @override
  State<OtpVeri> createState() => dipx();
}

class dipx extends State<OtpVeri> {
  bool isbtnpgrs=false;
int xt=0;

  bool isbtnpgrsx=false;
  

  void dinc() {}
  final pinController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();



  int rs = 1; 
  bool _canResend = false;
  late Timer _timer;


void _startTimer() {

    _canResend = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      mounted?
      setState(() {
        if (rs > 0) {
          rs--;
        } else {
          _canResend = true;
          _timer.cancel();
        }
      }):"";
    },);
  }




  @override
  void initState() {
    super.initState();
    _startTimer();
  }






Future<void> drf_login(BuildContext context) async {
   
   setState(() {
         isbtnpgrsx=true;

   });
   
   
    try {
      
   
    final dc = await http.post(
        Uri.parse("https://admin.returnlorry.com/appservice/otp"),
        body: json.encode({
          "userPhone": widget.userPhone,
          "deviceKey":
              "durLHMKZShKUM9EFmy8mnW:APA91bEe9ptlVoy9sGyFK0n97X135PS4R2vAJ60f-LKKOSTX9H_yQVu4jnoSOmMrkOUX7qbPqWIcXl4A5PqOW1hr-Tu1bCbNOtYf6QhhZc9jUNIY4eMJKSG2oQ1JUPnyIswX6AD21MpH"
        }));

    // final dc = await http.get(Uri.parse("http://127.0.0.1"));

    final rc = json.decode(dc.body);

    print(rc);


setState(() {
      widget.otp=rc["data"]["data"]["otp"];

});

 setState(() {
         isbtnpgrsx=false;

   });
    // print(rc["name"]);
    // setState(() {

 // ignore: use_build_context_synchronously

 // ignore: use_build_context_synchronously
//  Navigator.push(context, MaterialPageRoute(builder: (context) {
                           
//                          //  return  OtpVeri(t: rc["data"]["data"]["otp"]);
                           

//                          },));
    // });

     // ignore: empty_catches
     } catch (e) {
      
      
    }

   
   
  }




Future<void> drf_verifyotp() async {
   
   setState(() {
         isbtnpgrs=true;

   });
   
   
    try {
      
   
    final dc = await http.post(
        Uri.parse("https://admin.returnlorry.com/appservice/validateotp"),
        body: json.encode({
          "userPhone": widget.userPhone,
          "Otp":widget.otp
        }));

    // final dc = await http.get(Uri.parse("http://127.0.0.1"));

final SharedPreferences prefs = await SharedPreferences.getInstance();



    final jsonData = json.decode(dc.body);

print(jsonData);
    // if(jsonData?["data"]?["data"]?["user_type"]=="NA"){


       
          prefs.setString("userPhone", "${jsonData["data"]["data"]["phone"]}");
          prefs.setString("Token", "${jsonData["data"]["data"]["Token"]}");


          prefs.setString("userId", "${jsonData["data"]["data"]["id"]}");

if(context.mounted){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  L_4()));

}


    // print(rc["name"]);
    // setState(() {

 // ignore: use_build_context_synchronously

 // ignore: use_build_context_synchronously
//  Navigator.push(context, MaterialPageRoute(builder: (context) {
                           
//                          //  return  OtpVeri(t: rc["data"]["data"]["otp"]);
                           

//                          },));
    // });

     // ignore: empty_catches
    //  } 
     
     
     }
     // ignore: empty_catches
     catch (e) {
      print(e);
      
    }
  }




String timefmtx(int s) {
  
    int m = s ~/ 60;
    int rs = s % 60;
    return '${m.toString().padLeft(2, '0')}:${rs.toString().padLeft(2, '0')}';
  }



  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;

 








    return Scaffold(
        body: Center(

child:
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: xheight * 0.1, bottom: 20),
                  child: const Text(
                    "OTP Verification",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1B1E28)),
                  )),
              const Text(
                "Please check your mobile number to see the",
                style: TextStyle(color: Color(0xff7D848D), fontSize: 20),
              ),
              const Text(
                "Verification code",
                style: TextStyle(color: Color(0xff7D848D), fontSize: 20),
              ),


const Text(""),

                TextButton(
                  onPressed: () {
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                           
                          return  const RLogin();
                           

                         },));
                    
                    
                  },
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                      '+91 ${widget.userPhone}',
                      style: const TextStyle(color: Color(0xff0D6EFD), fontSize: 20),
                              ),
                
                
                    const SizedBox(width: 10,),
                    
                     const Icon(Icons.mode_edit)
                    
                   ],
                               ),
                ),

              
              const Padding(padding: EdgeInsets.only(top: 60)),
              Container(
                child: const Text(
                  "OTP code",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1B1E28)),
                ),
              ),
              // Container(
              //   child: const Column(
              //     children: [
              //       Row(
              //         children: [
              //           TextField(
              //             style: TextStyle(fontSize: 30),
              //             decoration: InputDecoration(
              //               // hintText: "hgy",
              //               border: OutlineInputBorder(
              //                   borderSide: BorderSide.none,
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(10))),
              //             ),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),

              SizedBox(
                height: xheight * .02,
              ),
              Pinput(
                length: 4,
                controller: pinController,
                listenForMultipleSmsOnAndroid: true,
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  return value == '${widget.otp}' ? rax() : 'Pin is incorrect';
                },
              ),
              SizedBox(
                height: xheight * .02,
              ),

              Container(
                  height: 50,
                  width: xwidth * .9,
                  child: ElevatedButton(
                    onPressed: () {

ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid otp"),backgroundColor: Colors.red,));

// showDialog(context: context, builder: (BuildContext context) {
//         return AlertDialog( title: "Message",content: "OTP is Invalid",actions: [TextButton(onPressed: , child: child)],
//         );

// }
// );


// otpveryfy();
 
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0D6EFD),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child:  isbtnpgrs? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(color: Colors.white,)),
                              
                              Text("     Please Wait")
                          
                          ],
                        ): Text(
                      'Verify${widget.otp}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  )),

SizedBox(height: xheight*.015),

            
            _canResend?
             Container(
                  height: 50,
                  width: xwidth * .9,
                  child: ElevatedButton(
                    onPressed: () {


drf_login(context);

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0D6EFD),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child:
                    
                    isbtnpgrsx? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(color: Colors.white,)),
                              
                              Text("     Please Wait")
                          
                          ],
                        ):
                    
                     const Text(
                      "Resend OTP",
                      style: TextStyle(fontSize: 20),
                    ),
                  )):
            SizedBox( width: xwidth*.8,child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Text("Resend code in"),
                    Text(timefmtx(rs))
                  ],)


)

            ],
          )
    
    
    ));
  }


  
  rax() {

    setState(() {
      isbtnpgrs=true;
    });

    drf_verifyotp();



return "";

  }
}


