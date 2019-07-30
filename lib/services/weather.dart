import '../services/location.dart';
import '../services/networking.dart';
import '../apiKey.dart';

const owmURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

Future<dynamic> getLocationWeather() async {
  Location locationObj = new Location();
  await locationObj.getCurrentLocation();

  print("Location acquired");NetworkHelper networkHelper = NetworkHelper('$owmURL?lat=${locationObj.latitude}&lon=${locationObj.longitude}&units=imperial&appid=$apiKey');

  var weatherData = await networkHelper.getData();

  return weatherData;
}

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 75) {
      return 'It\'s 🍦 time';
    } else if (temp > 65) {
      return 'Time for shorts and 👕';
    } else if (temp < 50) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
