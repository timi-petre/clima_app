import '/utilities/constants.dart';
import 'location.dart';
import 'networking.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    final NetworkHelper networkHelper =
        NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    final weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    final Location location = Location();
    await location.getCurrentLocation();

    final NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    final weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return "It's ๐ฆ time";
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return "You'll need ๐งฃ and ๐งค";
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
