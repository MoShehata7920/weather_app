import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

class WeatherService {
  final String apiKey;
  late WeatherFactory weatherFactory;

  WeatherService(this.apiKey) {
    weatherFactory = WeatherFactory(apiKey, language: Language.ENGLISH);
  }

  Future<Weather> getWeather(String cityName) async {
    try {
      Weather weather = await weatherFactory.currentWeatherByCityName(cityName);
      return weather;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to load weather data for $cityName: $e');
      }
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getcurrentCity() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        // Try using the locality first
        String? city = placemarks[0].locality;

        // If the locality is not available or not recognized by the API, try the subadministrative area
        if (city == null || city.isEmpty || city.contains('Qism')) {
          city = placemarks[0].subAdministrativeArea;
        }

        // If the subadministrative area is also not available, use the administrative area
        if (city == null || city.isEmpty) {
          city = placemarks[0].administrativeArea;
        }

        return city ?? "";
      } else {
        throw Exception('No placemarks found');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get current city: $e');
      }
      throw Exception('Failed to get current city');
    }
  }
}
