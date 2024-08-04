import 'package:flutter/material.dart';

import 'package:weather/weather.dart';
import "package:weather_app/consts/consts.dart";
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _weatherService = WeatherService(apiKey);
  Weather? _weather;
  String? _error;

  // Fetch weather
  _fetchWeather() async {
    try {
      String cityName = await _weatherService.getcurrentCity();
      // get weather for the city
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  // init state
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _error != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $_error'),
                  ElevatedButton(
                    onPressed: _fetchWeather,
                    child: const Text('Retry'),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_weather?.areaName ?? "Loading City.."),
                  Text('${_weather?.temperature?.celsius?.round() ?? 0}°C'),
                ],
              ),
      ),
    );
  }
}
