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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
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
              height: 60,
            ),
            const SizedBox(
              height: 80,
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
            const Spacer(
              flex: 2,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50,
              child: ElevatedButton(
                onPressed: nextButton,
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor.fromHex(languageSelectButtonColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'next'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                    color: HexColor.fromHex(textColor),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
