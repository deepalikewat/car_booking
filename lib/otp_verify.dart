import 'dart:async';

import 'package:car_booking/lorry.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OtpVeri extends StatefulWidget {
  
   const OtpVeri({super.key});

  @override
  State<OtpVeri> createState() => dipx();
}

class dipx extends State<OtpVeri> {
  void dinc() {}
  final pinController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  int rs = 120; 
  bool _canResend = false;
  late Timer _timer;


void _startTimer() {

    _canResend = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (rs > 0) {
          rs--;
        } else {
          _canResend = true;
          _timer.cancel();
        }
      });
    });
  }




  @override
  void initState() {
    super.initState();


    _startTimer();
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
                length: 5,
                controller: pinController,
                listenForMultipleSmsOnAndroid: true,
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  return value == '2222' ? "currect pin" : 'Pin is incorrect';
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

// otpveryfy();
  Navigator.push(context, MaterialPageRoute(builder: (context) {
                           
                           return L_4();
                           

                         },));

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0D6EFD),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text(
                      "Verify",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),

SizedBox(height: xheight*.015),

            
            _canResend?
             Container(
                  height: 50,
                  width: xwidth * .9,
                  child: ElevatedButton(
                    onPressed: () {
                      reSendOtp();

                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0D6EFD),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text(
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
}

void reSendOtp() {
}

void otpveryfy() {
}
