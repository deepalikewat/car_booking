
import 'package:flutter/material.dart';

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
