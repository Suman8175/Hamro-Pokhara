import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yhhhamropokhara/features/models/data/color_fetch/colors_getter.dart';
import 'package:yhhhamropokhara/features/screens/get_started/on_boarding_screen.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/bottombar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ColorFetcher colorFetcher = ColorFetcher();
  bool _loadingDataCheck = false;
  bool _isNewUser = true;
  @override
  void initState() {
    super.initState();
    loadData();
  }

//Loads colors from JSON files and also check value from SharedPreference
  Future<void> loadData() async {
    await colorFetcher.readJson();

    // Check SharedPreference for 'newUser'
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool newUser = prefs.getBool('newUser') ?? true;

    setState(() {
      _isNewUser = newUser;
      _loadingDataCheck = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loadingDataCheck) {
      if (_isNewUser) {
        return const OnBoarding();
      } else {
        return const NavigationMenu();
      }
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }
  }
}
