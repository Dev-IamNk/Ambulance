import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:geocoding/geocoding.dart';

class UserLocation{
  var place;
  Coords currentPostion=Coords(23, 23);
   Position ?position=null;
   void requestLocationPermission() async {
     LocationPermission permission = await Geolocator.checkPermission();
     if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
       permission = await Geolocator.requestPermission();
       if (permission == LocationPermission.denied) {
         print("Location permissions are still denied");
       } else if (permission == LocationPermission.deniedForever) {
         print("Location permissions are permanently denied");
       } else {
         print("Location permissions are granted after requesting");
       }
     }
     print(permission.name);
   }


   Future getUserLocation() async {
     var position = await GeolocatorPlatform.instance.getCurrentPosition();
       currentPostion = Coords(position.latitude, position.longitude);
      print(currentPostion.longitude);
      print(currentPostion.latitude);
     await placemarkFromCoordinates(currentPostion.latitude, currentPostion.longitude).then((pl) =>
     place= pl[2].name);
     print(place);
       return currentPostion;
   }



}