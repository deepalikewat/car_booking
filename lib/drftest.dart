import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class QTF extends StatefulWidget {
  @override
  State<QTF> createState() => QTM();
}

//gg
// ignore: camel_case_types
class QTM extends State<QTF> {
      String qt="Lol";

  
  
  @override
  Widget build(BuildContext context) {
    // double xwidth = MediaQuery.of(context).size.width;
    // double xheight = MediaQuery.of(context).size.height;

    return  Scaffold(
      body:
    Center(
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(qt,style: const TextStyle(fontSize: 20),)
        ,
     TextField(
onChanged: (value) {
  
setState(() {
  qt=value;

});



},

      decoration: const InputDecoration(
      border: OutlineInputBorder()

      ),
    )
       
    
    
    
        
    
      ],),
    )
      

    );
  }
}
