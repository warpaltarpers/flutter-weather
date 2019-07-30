import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../location.dart';
import 'dart:convert';
import '../apiKey.dart';

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
    getLocation();
  }

  void getLocation() async {
    Location locationObj = new Location();
    await locationObj.getCurrentLocation();
    
    latitude = locationObj.latitude;
    longitude = locationObj.longitude;

    getData();
  }

  void getData() async {
    http.Response response = await http.get('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&$longitude&appid=$apiKey');
    
    if(response.statusCode == 200) {
      String data = response.body;
      String name = jsonDecode(data)['name'];
      double temp = jsonDecode(data)['main']['temp'];
      int cond = jsonDecode(data)['weather'][0]['id'];
    } else {
      print(response.statusCode);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
