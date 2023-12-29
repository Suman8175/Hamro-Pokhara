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
late final String homepage_nav_color;
late final String top_categories;
late final String home_page_card1;
late final String home_page_card2;
late final String home_page_card3;
late final String popular_services_text_color;
late final String Profile_container1;
late final String profile_text_color;
late final String Profile_container2;
late final String profile_color;

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
      homepage_nav_color = data['color'][0]['homepage_nav_color'];
      top_categories = data['color'][0]['top_categories'];
      home_page_card1 = data['color'][0]['home_page_card1'];
      home_page_card2 = data['color'][0]['home_page_card2'];
      home_page_card3 = data['color'][0]['home_page_card3'];
      popular_services_text_color =
          data['color'][0]['popular_services_text_color'];
      Profile_container1 = data['color'][0]['Profile_container1'];
      profile_text_color = data['color'][0]['profile_text_color'];
      Profile_container2 = data['color'][0]['Profile_container2'];
      Profile_container2 = data['color'][0]['Profile_container2'];
      profile_color = data['color'][0]['profile_color'];
    } catch (e) {
      //Show Error here
    }
  }
}
