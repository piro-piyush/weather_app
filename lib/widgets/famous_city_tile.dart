import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/models/famous_city.dart';
import 'package:weather_app/providers/weather_by_city_provider.dart';
import 'package:weather_app/utils/get_weather_icons.dart';

class FamousCityTile extends ConsumerWidget {
  final int index;
  final FamousCity city;

  const FamousCityTile({super.key, required this.index, required this.city});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityWeatherData = ref.watch(weatheryByCityProvider(city.name));
    return cityWeatherData.when(
      data: (weather) {
        return Material(
          color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
          elevation: index == 0 ? 8 : 0,
          borderRadius: BorderRadius.circular(25),

          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Text(
                            "${weather.main.temp.round().toString()}°",
                            style: TextStyles.h2,
                          ),
                          Text(
                            weather.weather[0].description,
                            style: TextStyles.subtitleText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      width: 50,
                      getWeatherIcon(weatherCode: weather.weather[0].id),
                    ),
                  ],
                ),
                Text(
                  weather.name,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.white.withValues(alpha: .8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, st) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
