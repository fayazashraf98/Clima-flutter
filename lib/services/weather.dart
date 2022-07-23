import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';

const ApiKey='add7c20000c77fba430b937d72145a2b';
const openWeaterMapUrl="https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
Future<dynamic> getCityWeather(String cityName)async{

  NetworkHelper networkHelper=NetworkHelper('$openWeaterMapUrl?q=$cityName&appid=$ApiKey&units=metric');
  var weaterData=await networkHelper.getData();
  return weaterData;
}
  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    await location.getCurretLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeaterMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$ApiKey&units=metric');
    var WeatherData = await networkHelper.getData();
    return WeatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
