import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yhhhamropokhara/core/extensions/color_extension.dart';
import 'package:yhhhamropokhara/features/models/data/color_fetch/colors_getter.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/bottombar.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/homepage.dart';
import 'package:yhhhamropokhara/features/screens/login_signup/signup_screen.dart';

class LanguageCity extends StatefulWidget {
  const LanguageCity({super.key});

  @override
  State<LanguageCity> createState() => _LanguageCityState();
}

class _LanguageCityState extends State<LanguageCity> {
  late Color myColor;
  late double mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = HexColor.fromHex(primaryColor);
    mediaSize = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: myColor,
        image: const DecorationImage(
          image: AssetImage("assets/images/LoginImage.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor:
            Colors.transparent, //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        body: Stack(
          children: [
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 160,
        )
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: TextStyle(
          color: HexColor.fromHex(
              loginSignupNormalText), //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          fontWeight: FontWeight.bold),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          debugPrint("Email: ${emailController.text}");
          debugPrint("password: ${passwordController.text}");

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const NavigationMenu()));
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 20,
          shadowColor: myColor,
          backgroundColor: HexColor.fromHex(buttonColor),
          minimumSize: const Size.fromHeight(60),
        ),
        child: Text('login'.tr()));
  }
}
