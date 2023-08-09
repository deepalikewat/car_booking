import 'package:flutter/material.dart';

class L_3 extends StatefulWidget {
  @override
  State<L_3> createState() => dipx();
}

class dipx extends State<L_3> {
  void dinc() {}

  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 300, bottom: 20),
                  child: Text(
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
                  "OTP codex",
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                width: xwidth,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Verify", style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0D6EFD),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
