import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';

class RoundedTextField extends StatelessWidget {
  final TextEditingController controller;

  const RoundedTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.accentBlue,
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          fillColor: AppColors.white,
          focusColor: AppColors.white,
          contentPadding: EdgeInsets.only(left: 20, top: 10),
          hintText: "Search",
          hintStyle: TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          // prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
