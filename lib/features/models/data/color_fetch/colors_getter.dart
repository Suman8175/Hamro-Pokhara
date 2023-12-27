import 'dart:convert';
import 'package:flutter/services.dart';

late final String textColor;
late final String primaryColor;
late final String titleColor;
late final String getStartedColor;
late final String getStartedIconColor;
late final String loginpageheadingcolor;
late final String languageSelectButtonColor;
late final String loginSignupNormalText;
late final String loginSignupText2;
late final String buttonColor;

class ColorFetcher {
  Future<void> readJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json_files/color/color.json');
      final data = await json.decode(response);

      textColor = data['color'][0]['text_color'];
      primaryColor = data['color'][0]['primary_color'];
      titleColor = data['color'][0]['title_color'];
      getStartedColor = data['color'][0]['get_started_color'];
      buttonColor = data['color'][0]['button_color'];
      getStartedIconColor = data['color'][0]['get_started_icon_color'];
      loginpageheadingcolor = data['color'][0]['login_page_heading_color'];
      languageSelectButtonColor =
          data['color'][0]['language_select_button_color'];
      loginSignupNormalText = data['color'][0]['login_signup_normal_text'];
      loginSignupText2 = data['color'][0]['login_signup_text_2'];
    } catch (e) {
      //Show Error here
    }
  }
}
