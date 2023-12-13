import 'dart:convert';
import 'package:flutter/services.dart';

var textColor;
var primaryColor;
var titleColor;
var getStartedColor;
var getStartedIconColor;
var loginpageheadingcolor;
var languageSelectButtonColor;
var loginSignupNormalText;
var loginSignupText2;
var buttonColor;

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
    } catch (e) {}
  }
}
