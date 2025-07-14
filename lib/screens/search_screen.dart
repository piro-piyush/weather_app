import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/views/famous_cities_view.dart';
import 'package:weather_app/views/gradient_container.dart';
import 'package:weather_app/widgets/rounded_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _cityNameController;

  @override
  void initState() {
    super.initState();
    _cityNameController = TextEditingController();
  }

  @override
  void dispose() {
    _cityNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 30,
          children: [
            Text("Pick Location", style: TextStyles.h1),
            Text(
              "Find the area or city that  you want to know the detailed weather info at this time",
              style: TextStyles.subtitleText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 40),

        Row(
          spacing: 10,
          children: [
            Expanded(child: RoundedTextField(controller: _cityNameController)),
            const LocationButton(),
          ],
        ),
        const SizedBox(height: 30),
        // Famous Cities View
        FamousCitiesView(),
      ],
    );
  }
}

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.accentBlue,
      ),
      child: Icon(Icons.location_on_outlined, color: AppColors.white),
    );
  }
}
