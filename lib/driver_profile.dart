import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Driver extends StatefulWidget {
  const Driver();
  @override
  State<Driver> createState() => ri();
}

class ri extends State<Driver> {
  TextEditingController d_name = TextEditingController();
  TextEditingController d_num = TextEditingController();
  TextEditingController d_emailid = TextEditingController();
  TextEditingController d_addr = TextEditingController();
  TextEditingController d_adhar = TextEditingController();
  TextEditingController d_license = TextEditingController();
  // void dinc() {}
  Future<void> drf_driver() async {
    final datax = json.encode({
      "driver_name": d_name.text,
      "driver_phone": d_num.text,
      "driver_email": d_emailid.text,
      "driver_address": d_addr.text,
      "driver_aadhar_no": d_adhar.text,
      "driver_driving_license_no": d_license.text,
    });

    //   final dc = await http.post(Uri.parse("http://httpbin.org/post"),
    //       body: json.encode({
    //         "Token":
    //             "\$2y\$10\$ODc0YTBmMWM5NjIzNGZiZ.Ci8bXLB7A.BwQNMSd8KXUFIOF8d/hmO",
    //         "userId": 4,
    //         "userPhone": "9831166884",
    //         "userType": "2",
    //         "vehicle_no": "WB7564HG5",
    //         "vehicle_type": "Truck",
    //         "vehicle_source_pincode": "731224",
    //         "transport_year": "2014",
    //         "driver_name": r_name.text,
    //         "driver_phone": r_num.text,
    //         "driver_email": r_emailid.text,
    //         "driver_dob": "12/24/1958",
    //         "driver_aadhar_no": r_adhar.text,
    //         "driver_driving_license_no": r_license.text,
    //         "owner_aadhar_front_image": "2",
    //         "owner_aadhar_back_image": "2",
    //         "owner_photo": "2",
    //         "vehicle_photo": "2",
    //         "registration_certificate_front_image": "2",
    //         "registration_certificate_back_image": "2",
    //         "permit_part_a_image": "2",
    //         "permit_part_b_image": "2",
    //         "permit_part_optional_image": "2",
    //         "vehicle_insurance_image": "2",
    //         "driver_adhar_front_image": "2",
    //         "driver_adhar_back_image": "2",
    //         "driver_driving_license_front_image": "2",
    //         "driver_driving_license_back_image": "2"
    //       }));

    //   // final dc = await http.get(Uri.parse("http://127.0.0.1"));

    //   // final rc = json.decode(dc.body);
    //   print(r_name.text);
    //   print(r_num.text);
    //   print(r_emailid.text);

    //   print(r_adhar.text);
    //   print(r_license.text);

    //   print(dc.body);
    //   // print(rc);
    //   // print(rc["name"]);
    //   // setState(() {

    //   // });

    print(datax);
  }

  void dinc() {}

  @override
  Widget build(BuildContext context) {
    double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
          child: Column(children: [
        SizedBox(
          height: xheight * .01,
        ),
        const Text(
          "Driver Profile",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xff1B1E28)),
        ),
        Padding(padding: EdgeInsets.only(top: xheight * 0.03)),
        Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, border: Border.all()),
          height: 120,
          width: 122,
          child: const ClipOval(
              child: Image(
            image: AssetImage("img/QT.jpeg"),
            width: 100,
            height: 300,
            fit: BoxFit.cover,
          )),
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
          child: TextField(
            controller: d_name,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
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
          child: TextField(
            controller: d_num,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
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
          child: TextField(
            controller: d_emailid,
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
          width: xwidth - 70,
          child: const Text(
            "Full Address",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          width: xwidth - 60,
          child: TextField(
            controller: d_addr,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "Enter Full Address",
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            bottom: 8,
          ),
          width: xwidth - 70,
          child: const Text(
            "Aadhar Card Number",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          width: xwidth - 60,
          child: TextField(
            controller: d_adhar,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "000 000 000 000 00",
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            bottom: 8,
          ),
          width: xwidth - 70,
          child: const Text(
            "Driving License Number",
            style: TextStyle(fontSize: 18, color: Color(0xff1B1E28)),
          ),
        ),
        Container(
          width: xwidth - 60,
          child: TextField(
            controller: d_license,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: "00000 0000",
            ),
          ),
        ),
        const Expanded(child: Text("")),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: 60,
          width: xwidth,
          child: ElevatedButton(
            onPressed: () {
              drf_driver();
            },
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
      ])),
    );
  }
}
