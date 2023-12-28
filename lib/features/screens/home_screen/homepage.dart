import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yhhhamropokhara/core/extensions/color_extension.dart';
import 'package:yhhhamropokhara/features/models/data/color_fetch/colors_getter.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/basic_categories.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/popular_services.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/top_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: HexColor.fromHex(homepage_nav_color),
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(40))),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'hamro_pokhara'.tr(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 42,
                      // width: double.infinity * 0.5,
                      margin: const EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.only(right: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(
                                left: 6,
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 12),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          hintText: 'search'.tr(),
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'top_categories'.tr(),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: HexColor.fromHex(top_categories)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    elevation: 2,
                    color: HexColor.fromHex(home_page_card1),
                    child: const TopCategories()),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    elevation: 2,
                    color: HexColor.fromHex(home_page_card2),
                    child: const BasicCategories()),
              ),
              Text(
                'popular_services'.tr(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: HexColor.fromHex(popular_services_text_color),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    elevation: 2,
                    color: HexColor.fromHex(home_page_card3),
                    child: const PopularServices()),
              ),
              Container(
                color: Colors.amber,
                height: 250,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
