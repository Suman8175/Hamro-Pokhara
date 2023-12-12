import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yhhhamropokhara/core/extensions/color_extension.dart';
import 'package:yhhhamropokhara/features/models/data/color_fetch/colors_getter.dart';
import 'package:yhhhamropokhara/features/models/data/get_started/get_started.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/home_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  PageController _controller = PageController();

  //Function which does skio and continue button work and navigate user to next screen
  void onTap(BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('newUser', false);
    print(sp.getBool('newUser'));
    if (context.mounted) {
      Navigator.pushReplacement(
          (context), MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(contents[i].image),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          contents[i].title,
                          style: TextStyle(
                            color: HexColor.fromHex(titleColor),
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          contents[i].discription,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: HexColor.fromHex(textColor),
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width) * 0.38,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  contents.length, (index) => builddot(index, context)),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width) * 0.14,
            ),
            TextButton.icon(
              onPressed: () {
                onTap(context);
              },
              label: Icon(
                Icons.arrow_forward_ios,
                color: HexColor.fromHex(getStartedIconColor),
              ),
              icon: Text(
                'skip'.tr(),
                style: TextStyle(
                  color: HexColor.fromHex(textColor),
                  fontSize: 18,
                ),
              ),
            )
          ]),
          Container(
            height: 55,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            color: HexColor.fromHex(getStartedColor),
            child: TextButton(
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  onTap(context);
                }
                _controller.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
              child: Text(
                currentIndex == contents.length - 1
                    ? 'continue'.tr()
                    : 'next'.tr(),
                style: TextStyle(
                  color: HexColor.fromHex(textColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container builddot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: HexColor.fromHex(primaryColor),
      ),
    );
  }
}
