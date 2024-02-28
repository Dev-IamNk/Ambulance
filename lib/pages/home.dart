import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trafficassister/backend/auth.dart';
import 'package:trafficassister/pages/hospital.dart';
import 'package:trafficassister/pages/spot.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color c = Color.fromRGBO(244, 157, 162, 1);
  TextStyle w= GoogleFonts.poppins(fontSize:20,color:Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        actions: [
           /* IconButton(onPressed: (){
              Firebas fb=Firebas();
              fb.signingOut();
            }, icon: Icon(Icons.logout_rounded))*/ //
        ],
        title: Text("Traffic Assist",style: GoogleFonts.poppins(fontSize:25,color:Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(244, 157, 162, 1),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),

          )
        ),
      ),

      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>Hospital()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(244, 157, 162, 1),
                    ),
                    height: 170,
                    width: 220,
                    child: Center(
                      child: Text("HOSPITAl",style: GoogleFonts.poppins(fontSize:20,color:Colors.white),),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>Spot()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color.fromRGBO(244, 157, 162, 1),
                    ),
                    height: 170,
                    width: 220,
                    child: Center(
                      child: Text(
                        "SPOT",style: GoogleFonts.poppins(fontSize:20,color:Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 100,
              left:-20,
              child: Hero(
                  tag: "hos",
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>Hospital()));
                      },
                      child: Image.asset("assets/hm.jpeg",scale: 2,)))),
          Positioned(
              top: 305,
              left:40,
              child: Hero(
                  tag: "spo",
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>Spot()));
                      },
                      child: Image.asset("assets/crash.jpeg",scale: 2.1,)))),
        ],
      ),
    );
  }
}
