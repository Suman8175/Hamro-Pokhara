import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationChecker {
  static changeLanguge(BuildContext context, String language) {
    /* if (currentLocal == const Locale('en', 'US')) {
      EasyLocalization.of(context)!.setLocale(const Locale('ne', 'NP'));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    } */

    if (language == 'English' || language == 'अंग्रेजी') {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    } else if (language == 'Nepali' || language == 'नेपाली') {
      EasyLocalization.of(context)!.setLocale(const Locale('ne', 'NP'));
    }
  }
}
