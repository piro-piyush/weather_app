import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weekly_weather.dart';
import 'package:weather_app/services/geo_locator.dart';
import 'package:weather_app/utils/logging.dart';

/// A utility class for interacting with external weather APIs.
/// This class handles fetching current, hourly, and weekly weather data
/// using the OpenWeatherMap and Open-Meteo APIs.
///
/// All methods are static and the class is immutable.
@immutable
class ApiHelper {
  /// Base URL for OpenWeatherMap API
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';

  /// Base URL for Open-Meteo API (used for weekly forecasts)
  static const String weeklyWeatherUrl =
      'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';

  /// Stores current latitude and longitude
  static double lat = 0.0;
  static double lon = 0.0;

  /// Dio instance for performing HTTP requests
  static final Dio dio = Dio();

  /// Fetches the current device location and stores it in [lat] and [lon].
  static Future<void> fetchLocation() async {
    final location = await getLocation(
    );
    lat = location.latitude;
    lon = location.longitude;
  }

  /// Fetches current weather data based on device location.
  static Future<Weather> getCurrentWeather() async {
    await fetchLocation();
    final url = _constructWeatherUrl();
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  /// Fetches hourly forecast based on device location.
  static Future<HourlyWeather> getHourlyForecast() async {
    await fetchLocation();
    final url = _constructForecastUrl();
    final response = await _fetchData(url);
    return HourlyWeather.fromJson(response);
  }

  /// Fetches current weather based on a specific city name.
  static Future<Weather> getWeatherByCity(String city) async {
    final url = _constructWeatherByCityUrl(city);
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  /// Fetches weekly forecast based on device location.
  static Future<WeeklyWeather> getWeeklyForecast() async {
    await fetchLocation();
    final url = _constructWeeklyForecastUrl();
    final response = await _fetchData(url);
    return WeeklyWeather.fromJson(response);
  }

  //////////////////////////////////////////////////////////////////////////////
  //                             Private Helpers                              //
  //////////////////////////////////////////////////////////////////////////////

  /// Constructs the URL for current weather data using latitude and longitude.
  static String _constructWeatherUrl() =>
      '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  /// Constructs the URL for hourly forecast using latitude and longitude.
  static String _constructForecastUrl() =>
      '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  /// Constructs the URL to fetch weather by city name.
  static String _constructWeatherByCityUrl(String city) =>
      '$baseUrl/weather?q=$city&units=metric&appid=${Constants.apiKey}';

  /// Constructs the URL for weekly forecast using Open-Meteo.
  static String _constructWeeklyForecastUrl() =>
      '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';

  /// Makes an HTTP GET request and returns the response as a JSON map.
  static Future<Map<String, dynamic>> _fetchData(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        printWarning("Failed to load data: ${response.statusCode}");
        throw Exception("Failed to load data");
      }
    } catch (e) {
      printWarning("Error fetching data from $url: $e");
      throw Exception("Failed to fetch data from $url");
    }
  }
}
