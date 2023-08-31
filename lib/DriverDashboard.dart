import 'dart:ui';

import 'package:flutter/material.dart';

class DriverDashBoard extends StatefulWidget {
  @override

    State<DriverDashBoard> createState() => DriverDashBoardx();

}

class DriverDashBoardx  extends State<DriverDashBoard>{
  @override
  Widget build(BuildContext context) {

 double xwidth = MediaQuery.of(context).size.width;
    double xheight = MediaQuery.of(context).size.height;

   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


   
return Scaffold(key: _scaffoldKey,

    
    drawer: const Drawer(backgroundColor: Color(0xff0F6868)),
   body: Stack(
     children: [
       Container(
          height: xheight*.45,


          decoration: const BoxDecoration(
          
          gradient: LinearGradient(
                    colors: [Color(0xff1B7D7D), Color(0xff828448)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                  ),

        ),
                  
           child:  SafeArea(
             child: Column(
               children: [
                const SizedBox(height: 10,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                IconButton(onPressed: (){
_scaffoldKey.currentState!.openDrawer();
                }, icon: const Icon(Icons.menu,size: 40,color: Colors.white,),

                ),
                const Text("Return Lorry", textAlign: TextAlign.center, style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                 IconButton(onPressed: (){
_scaffoldKey.currentState!.openDrawer();
                }, icon: const Icon(Icons.circle_notifications,size: 40,color: Colors.white, ),

                ),
                
                ]
                
                
                
                ,)
               ],
             ),
           ),

       )
       ,


Container(
  width: xwidth,
  margin: EdgeInsets.only(top: xheight*.3),
  decoration: const BoxDecoration(


color: Color.fromARGB(255, 132, 17, 17),

borderRadius: BorderRadius.only(topLeft: Radius.circular(
  30
),topRight: Radius.circular(30))

  ),
  child:   const Column(
  
  
  
    children: [
  
  Text("data")
  
    ],
  
  ),
)



     ],
   )
       


);

  }

}
