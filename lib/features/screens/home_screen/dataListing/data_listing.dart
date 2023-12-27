import 'dart:convert';

import 'package:flutter/material.dart';

class HospitalDataModel {
  final String hospitalName;
  final String imageUrl;
  final String location;
  final String phoneNo;

  HospitalDataModel({
    required this.hospitalName,
    required this.imageUrl,
    required this.location,
    required this.phoneNo,
  });

  factory HospitalDataModel.fromJson(Map<String, dynamic> json) {
    return HospitalDataModel(
      hospitalName: json['hospital_name'],
      imageUrl: json['image_url'],
      location: json['Location'],
      phoneNo: json['PhoneNo'],
    );
  }
}

class DataListing extends StatefulWidget {
  const DataListing({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DataListingState createState() => _DataListingState();
}

class _DataListingState extends State<DataListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40))),
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
                  var hospitals = data.data as List<HospitalDataModel>;
                  int itemCount = hospitals.length;
                  return ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 7,
                        shadowColor: Colors.deepPurple,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
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
                              width: 9,
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
                                      hospitals[index].imageUrl,
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
                                              hospitals[index].hospitalName,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              hospitals[index].location,
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              hospitals[index].phoneNo,
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

  Future<List<HospitalDataModel>> readJsonData() async {
    final jsondata = await DefaultAssetBundle.of(context)
        .loadString('assets/json_files/listing/listing.json');
    final Map<String, dynamic> jsonDataMap = json.decode(jsondata);
    final List<dynamic> hospitalList = jsonDataMap['hospital'];
    return hospitalList.map((e) => HospitalDataModel.fromJson(e)).toList();
  }
}
