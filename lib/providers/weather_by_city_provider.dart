import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/api_helper.dart';

final weatheryByCityProvider = FutureProvider.autoDispose
    .family<Weather, String>((ref, String city) {
      return ApiHelper.getWeatherByCity(city);
    });
