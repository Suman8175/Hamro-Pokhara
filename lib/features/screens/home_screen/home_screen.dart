// ignore: file_names
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yhhhamropokhara/core/extensions/color_extension.dart';
import 'package:yhhhamropokhara/features/language/localization_checker.dart';
import 'package:yhhhamropokhara/features/models/data/color_fetch/colors_getter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Tooltip(
            message: "change_language".tr(),
            child: IconButton(
                onPressed: () {
                  LocalizationChecker.changeLanguge(context, 'English');
                },
                icon: const Icon(Icons.language)))
      ]),
      body: Center(
        child: Text(
          'home_page'.tr(),
          style: TextStyle(
            color: HexColor.fromHex(titleColor),
          ),
        ),
      ),
    );
  }
}
