import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location locationObj = new Location();
    await locationObj.getCurrentLocation();
    print(locationObj.latitude.toString() + ", " + locationObj.longitude.toString());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
