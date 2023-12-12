import 'dart:convert';
import 'package:flutter/services.dart';

var textColor;
var primaryColor;
var titleColor;
var getStartedColor;
var getStartedIconColor;

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
      getStartedIconColor = data['color'][0]['get_started_icon_color'];
    } catch (e) {}
  }
}
