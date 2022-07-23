import 'package:clima_app/screens/city_screen.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import '../utilites/constants.dart';

class LocationScreen extends StatefulWidget {

  final locationWeather;
  LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather =WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String getWeatherMessage;
  //late int condition;
  late String cityName;
  @override
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);
  }
  void updateUI(dynamic weatherData){
    setState((){
      if(weatherData==null){
        temperature=0;
        weatherIcon='error';
        getWeatherMessage='unable to get weater data';
        cityName='';
        return;
      }
      double temp=weatherData['main']['temp'];
      temperature=temp.toInt();
      var condition=weatherData['weather'][0]['id'];
      weatherIcon= weather.getWeatherIcon(condition);
      getWeatherMessage= weather.getMessage(temperature);
      cityName=weatherData['name'];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('Assets/images/backimage.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: ()async {
                      var weatherData=await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 40.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: ()async {
                     var typeName=await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                    if(typeName!=null){
                     var weatherData=await weather.getCityWeather(typeName);
                     updateUI(weatherData);
                    }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 40.0,

                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cityName,
                    style:kCityTextStyle,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weatherIcon,
                    style: kConditionTextStyle,
                  ),
                  Text(
                    '$temperature°',
                    style: kTempTextStyle,
                  ),
                ],
              ),
              const Spacer(),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getWeatherMessage,
                    style: kMessageTextStyle,
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}