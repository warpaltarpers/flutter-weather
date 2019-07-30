import 'package:clima/apiKey.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import '../services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
  double latitude;
  double longitude;
  
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location locationObj = new Location();
    await locationObj.getCurrentLocation();

    print("Location acquired");
    
    latitude = locationObj.latitude;
    longitude = locationObj.longitude;

    print("Lat: $latitude, Lon: $longitude");

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
