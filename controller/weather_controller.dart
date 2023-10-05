import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:openweather_map_flutter/model/weather_model.dart';

class WeatherController {
  final WeatherModel weatherModel = WeatherModel();

  Future<void> fetchWeatherData(String city) async {
    const apiKey = '5dd5dbb1cc222d9acd612459910c8d1e';
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result.toString());
      weatherModel.cityName = result['name'];
      weatherModel.temperature = result['main']['temp'].toString();
      weatherModel.iconUrl =
      'https://openweathermap.org/img/w/${result['weather'][0]['icon']}.png';
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
