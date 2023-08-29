import 'package:flutter/material.dart';

class UploadDashboard extends StatefulWidget {
  @override
  State<UploadDashboard> createState() => updash();
}

class updash extends State<UploadDashboard> {
  
   void dinc(BuildContext context,String title,) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
              )
          );
        }
    );
   }

  @override
  Widget build(BuildContext context) {
 
 

 return  Scaffold(


body: Center(
  child:   Column(children: [
  
  
    
    Container(
      child: Row(children: [
    
    
    // ElevatedButton(onPressed:()=> dinc(context,"adhar card"), child:
    
    //  )
    
    
      ],),
    )
  
  ]),
),

 );


  }




}

