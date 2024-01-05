import 'dart:convert';

import 'package:flutter/material.dart';

class BookmarkDataModel {
  final String name;
  final String imageUrl;
  final String location;
  final String description;

  BookmarkDataModel({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.description,
  });

  factory BookmarkDataModel.fromJson(Map<String, dynamic> json) {
    return BookmarkDataModel(
      name: json['Name'],
      imageUrl: json['image_url'],
      location: json['Location'],
      description: json['Description'],
    );
  }
}

class BookmarkListing extends StatefulWidget {
  const BookmarkListing({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookmarkListingState createState() => _BookmarkListingState();
}

class _BookmarkListingState extends State<BookmarkListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Hamro Pokhara',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Padding(
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
                        contentPadding: const EdgeInsets.only(top: 10),
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
                            width: 1.2,
                          ),
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: readJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  var bookmark = data.data as List<BookmarkDataModel>;
                  int itemCount = bookmark.length;
                  return ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0.5,
                        shadowColor: Colors.deepPurple,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 130,
                              width: 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.deepPurple),
                            ),
                            Expanded(
                              child: Container(
                                height: 150,
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      bookmark[index].imageUrl,
                                      height: 80,
                                      // width: 100,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 35, bottom: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              bookmark[index].name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              bookmark[index].location,
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              bookmark[index].description,
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.phone,
                                            color: Colors.deepPurple,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            // Add phone icon click action here
                                            print('Phone icon clicked');
                                          },
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.location_on,
                                            size: 30,
                                            color: Colors.deepOrange,
                                          ),
                                          onPressed: () {
                                            // Add location icon click action here
                                            print('Location icon clicked');
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<BookmarkDataModel>> readJsonData() async {
    final jsondata = await DefaultAssetBundle.of(context)
        .loadString('assets/json_files/listing/bookmark.json');
    final Map<String, dynamic> jsonDataMap = json.decode(jsondata);
    final List<dynamic> bookmarkList = jsonDataMap['bookmark'];
    return bookmarkList.map((e) => BookmarkDataModel.fromJson(e)).toList();
  }
}
