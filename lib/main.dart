import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/dataListing/data_listing.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/homepage.dart';
import 'package:yhhhamropokhara/features/screens/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ne', 'NP'),
        ],
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
