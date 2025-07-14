import 'package:flutter/material.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/models/weather.dart';

class WeatherInfo extends StatelessWidget {
  final Weather weather;

  const WeatherInfo({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherInfoTile(
            title: "Temp",
            value: "${weather.main.temp.toStringAsFixed(2)}°",
          ),
          WeatherInfoTile(
            title: "Wind",
            value: "${weather.main.temp.toStringAsFixed(2)} km/h",
          ),
          WeatherInfoTile(
            title: "Humidity",
            value: "${weather.main.temp.toStringAsFixed(2)}%",
          ),
        ],
      ),
    );
  }
}

class WeatherInfoTile extends StatelessWidget {
  final String value;
  final String title;

  const WeatherInfoTile({super.key, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text(title, style: TextStyles.subtitleText),
        Text(value, style: TextStyles.h3),
      ],
    );
  }
}
