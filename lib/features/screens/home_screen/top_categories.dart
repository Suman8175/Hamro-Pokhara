import 'package:flutter/material.dart';
import 'package:yhhhamropokhara/core/constants/global_variables.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/dataListing/data_listing.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
            itemCount: GlobalVariables.categoryImages.length,
            scrollDirection: Axis.horizontal,
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DataListing()));
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            GlobalVariables.categoryImages[index]['image']!,
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ),
                      Text(
                        GlobalVariables.categoryImages[index]['title']!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
