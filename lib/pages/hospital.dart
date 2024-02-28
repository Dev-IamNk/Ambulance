import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:trafficassister/backend/firestore.dart';
import 'package:trafficassister/backend/location.dart';

class Hospital extends StatefulWidget {



  @override
  State<Hospital> createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  TextStyle w= GoogleFonts.poppins(fontSize:20,color:Colors.white);
  Coords coords =Coords(123,342);
  var lat;
  var long;
  final f=FCollection();
  final l=UserLocation();
  openMapsSheet(context,String a,var lat,var long) async {
    await locationFromAddress(_addressController.text)
        .then((locations) {
      var output = 'No results found.';
      if (locations.isNotEmpty) {
        output = locations[0].toString();
      }
      setState(() {
        _output = output;
        lat=locations[0].latitude;
        long=locations[0].longitude;
      });
    });
    try {
      final coords = Coords(lat,long);
      final title = a;
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () =>
                            map.showMarker(
                              coords: coords,
                              title: title,
                            ),
                        title: Text(map.mapName),

                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
  final TextEditingController _addressController = TextEditingController();
  String _output = '';
  @override
  void initState() {
   // var txt="Manakula vinayagar institute of technology, Puducherry";
    _addressController.text = 'Manakula vinayagar Medical college and Hospital, Puducherry';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final TextEditingController destination =TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Hospital",style:GoogleFonts.poppins(fontSize:25,color:Colors.white)),
        backgroundColor: Color.fromRGBO(244, 157, 162, 1),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),

            )
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                top: -22,
                child: Hero(
                  tag: "hos",
                  child: Container(
                    height: 130,
                    child: Image.asset("assets/hm.jpeg"),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 70,
                    width: 260,
                    margin: EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color.fromRGBO(244, 157, 162, 1)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Icon(Icons.search, color: Colors.white, size: 38,),
                        Container(
                            padding: EdgeInsets.all(10),
                            width: 180,
                            child: TextField(
                              onTap: (){
                                _addressController.clear();
                              },
                              style: TextStyle(color: Colors.white70),
                              controller: _addressController,
                              decoration: InputDecoration(
                                hintText: "Enter Location",
                                hintStyle: TextStyle(
                                    color: Colors.white70
                                ),
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 75,),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Card(
                      elevation: 25,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          child: InkWell(
                              onTap: () async => openMapsSheet(context,destination.text,lat,long),
                              child: Image.asset("assets/map.jpg"))),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: 260,
                    margin: EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color.fromRGBO(244, 157, 162, 1)),
                    child: TextButton(
                      onPressed: ()async{
                        l.requestLocationPermission();
                        await  l.getUserLocation();
                        await f.sendData(l.place,_addressController.text);
                       print("Please clear traffic from "+l.place+" to "+_addressController.text);
                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                           behavior: SnackBarBehavior.floating,
                           margin: EdgeInsets.all(20),
                           content: Center(child: Text("Request has been sent!",style: GoogleFonts.poppins(fontSize:15,color:Colors.white),)),backgroundColor: Color.fromRGBO(244, 157, 162, 1),shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(20)),
                         ),)
                       );
                      },
                      child: Text(
                        "Send Request",
                        style: w,
                      )
                    ),),


                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}