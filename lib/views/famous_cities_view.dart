import 'package:flutter/material.dart';
import 'package:weather_app/models/famous_city.dart';
import 'package:weather_app/screens/weather_detail_screen.dart';
import 'package:weather_app/widgets/famous_city_tile.dart';

class FamousCitiesView extends StatelessWidget {
  const FamousCitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemCount: famousCities.length,
      itemBuilder: (context, int index) {
        final city = famousCities[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WeatherDetailScreen(city: city),
              ),
            );
          },
          child: FamousCityTile(index: index, city: city),
        );
      },
    );
  }
}
