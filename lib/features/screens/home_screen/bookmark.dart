import 'dart:convert';
import 'package:flutter/material.dart';

class BookmarkDataModel {
  final String name;
  final String imageUrl;
  final String location;
  final String PhoneNo;

  BookmarkDataModel({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.PhoneNo,
  });

  factory BookmarkDataModel.fromJson(Map<String, dynamic> json) {
    return BookmarkDataModel(
      name: json['Name'],
      imageUrl: json['image_url'],
      location: json['Location'],
      PhoneNo: json['PhoneNo'],
    );
  }
}

class BookmarkListing extends StatefulWidget {
  const BookmarkListing({super.key});

  @override
  _BookmarkListingState createState() => _BookmarkListingState();
}

class _BookmarkListingState extends State<BookmarkListing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Bookmarks',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        bookmark[index].imageUrl,
                                        height: 80,
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
                                                bookmark[index].PhoneNo,
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
