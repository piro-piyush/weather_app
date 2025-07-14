import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/settings_screen.dart';
import 'package:weather_app/screens/weather_screens/weather_screen.dart';

import 'forecast_report_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<NavigationDestination> _destinations = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined, color: AppColors.white),
      selectedIcon: Icon(Icons.home, color: AppColors.white),
      label: '',
    ),
    NavigationDestination(
      icon: Icon(Icons.search_outlined, color: AppColors.white),
      selectedIcon: Icon(Icons.search, color: AppColors.white),
      label: '',
    ),
    NavigationDestination(
      icon: Icon(Icons.wb_sunny_outlined, color: AppColors.white),
      selectedIcon: Icon(Icons.wb_sunny, color: AppColors.white),
      label: '',
    ),
    NavigationDestination(
      icon: Icon(Icons.settings_outlined, color: AppColors.white),
      selectedIcon: Icon(Icons.settings, color: AppColors.white),
      label: '',
    ),
  ];

  final List<Widget> _screens = const [
    WeatherScreen(),
    SearchScreen(),
    ForecastReportScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.accentBlue,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(top: false, child: _screens[_currentIndex]),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(backgroundColor: AppColors.secondaryBlack),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: _destinations,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: Colors.transparent,
        ),
      ),
    );
  }
}
