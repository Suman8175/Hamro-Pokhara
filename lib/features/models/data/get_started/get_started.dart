import 'package:easy_localization/easy_localization.dart';

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'get_started_title1'.tr(),
      image: 'assets/images/Get_Started1.jpg',
      discription: 'get_started_description1'.tr()),
  UnbordingContent(
      title: 'get_started_title2'.tr(),
      image: 'assets/images/Get_Started2.jpg',
      discription: 'get_started_description2'.tr()),
  UnbordingContent(
      title: 'get_started_title3'.tr(),
      image: 'assets/images/Get_Started3.jpg',
      discription: 'get_started_description3'.tr()),
];
