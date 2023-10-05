import 'package:flutter/material.dart';
import 'package:openweather_map_flutter/view/weather_view.dart';
import 'controller/weather_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final WeatherController controller = WeatherController();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WeatherScreen(controller: controller),
        );
    }
}