import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yhhhamropokhara/core/extensions/color_extension.dart';
import 'package:yhhhamropokhara/features/language/localization_checker.dart';
import 'package:yhhhamropokhara/features/models/data/color_fetch/colors_getter.dart';
import 'package:yhhhamropokhara/features/screens/login_signup/login_screen.dart';

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
  String? dropDownIndex;
  String? dropDownIndexLanguage;
  var dropDownList = ["Pokhara"];
  var dropDownLanguage = ["English", "नेपाली"];
  void nextButton() {
    dropDownIndex ??= 'Pokhara';
    dropDownIndexLanguage ??= 'English';
    Navigator.pushReplacement(
        (context), MaterialPageRoute(builder: (context) => const LoginPage()));
  }

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${'location'.tr()}  :',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: HexColor.fromHex(textColor)),
            ),
            Container(
              width: 140,
              padding: const EdgeInsets.only(left: 12, right: 0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                icon: const Expanded(
                  child: Icon(
                    Icons.expand_more,
                    size: 20,
                  ),
                ),
                dropdownColor: Colors.white,
                // hint: const Text("Pokhara"),

                enableFeedback: true,
                // isExpanded: true,
                iconSize: 16,
                borderRadius: BorderRadius.circular(16),
                style: const TextStyle(
                  color: Colors.black,
                ),
                items: dropDownList
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ))
                    .toList(),
                onChanged: (String? index) {
                  setState(() {
                    dropDownIndex = index;
                  });
                },
                value: dropDownIndex ?? 'Pokhara',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${'language'.tr()}  :',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: HexColor.fromHex(textColor),
              ),
            ),
            Container(
              width: 140,
              padding: const EdgeInsets.only(left: 12, right: 0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                icon: const Expanded(
                    child: Icon(
                  Icons.expand_more,
                  size: 20,
                )),
                dropdownColor: Colors.white,
                enableFeedback: true,
                // isExpanded: true,
                iconSize: 16,
                borderRadius: BorderRadius.circular(16),
                style: const TextStyle(
                  color: Colors.black,
                ),
                items: dropDownLanguage
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ))
                    .toList(),
                onChanged: (String? index2) {
                  setState(() {
                    dropDownIndexLanguage = index2;
                    //Change language when selected other language::

                    LocalizationChecker.changeLanguge(
                        context, dropDownIndexLanguage!);
                  });
                },
                value: dropDownIndexLanguage ?? 'English',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        _buildLoginButton(context),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        onPressed: nextButton,
        label: Icon(
          Icons.arrow_forward_ios,
          color: HexColor.fromHex(getStartedIconColor),
        ),
        icon: Text(
          'next'.tr(),
          style: TextStyle(
            color: HexColor.fromHex(textColor),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
