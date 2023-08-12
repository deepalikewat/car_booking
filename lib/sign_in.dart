import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => logx();
}

class logx extends State<Login> {
  void dinc() {}

  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
             Padding(
              padding: EdgeInsets.only(top: xheight*0.27, bottom: 20),
              child: const Text(
                "Sign in now",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1B1E28)),
              ),
            ),
            const Text(
              "Please sign in to continue our app",
              style: TextStyle(color: Color(0xff7D848D), fontSize: 20),
            ),
            const Padding(padding: EdgeInsets.all(50)),
                // // padding: EdgeInsets.symmetric(horizontal: 20),
                // decoration: BoxDecoration(
                //     border: Border.all(color: const Color(0x87878799)),
                //     borderRadius: BorderRadius.circular(10)),
                // child: Row(children: [
                //   const Text(
                //     "  +91",
                //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //   ),
            
                  Container(
                    height: 60,
                    child: const TextField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: "Your numbmer",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                
            const Padding(padding: EdgeInsets.all(30)),
            const Text(
              "We Will Sent you an OTP on This Mobile",
              style: TextStyle(color: Color(0xff7D848D), fontSize: 20),
            ),
            const Text(
              "Number to verify",
              style: TextStyle(color: Color(0xff7D848D), fontSize: 20),
            ),
            const Padding(padding: EdgeInsets.only(top: 250)),
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
          ])
        ],
      ),
    ));
  }
}
