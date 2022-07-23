
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override

  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weaterData=await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        locationWeather: weaterData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
        SpinKitWave(
          color: Colors.black,
          size: 50,
        )
      ),
    );
  }
}