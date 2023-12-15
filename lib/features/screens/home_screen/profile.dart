import 'package:flutter/material.dart';
import 'package:yhhhamropokhara/features/language/localization_checker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? dropDownIndex;
  String? dropDownIndexLanguage;
  var dropDownList = ["Pokhara"];
  var dropDownLanguage = ["English", "नेपाली"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          ListView(
            children: [
              Container(
                color: Colors.deepPurple,
                height: MediaQuery.of(context).size.height * 0.33,
                padding: const EdgeInsets.only(bottom: 115),
                child: const Center(
                  child: Text(
                    'PROFILE',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const ListTile(
                title: SizedBox(
                  height: 100,
                ),
              ),
              ListTile(
                title: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.location_city,
                            size: 30,
                          ),
                          title: Container(
                            width: 140,
                            height: 70,
                            padding: const EdgeInsets.only(left: 12, right: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: DropdownButton(
                                icon: const Expanded(
                                  child: Icon(
                                    Icons.expand_more,
                                    size: 30,
                                  ),
                                ),
                                dropdownColor: Colors.white,
                                enableFeedback: true,
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
                                            style:
                                                const TextStyle(fontSize: 24),
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
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.language,
                            size: 30,
                          ),
                          title: Container(
                            width: 140,
                            height: 70,
                            padding: const EdgeInsets.only(left: 12, right: 0),
                            child: Center(
                              child: DropdownButton(
                                icon: const Expanded(
                                    child: Icon(
                                  Icons.expand_more,
                                  size: 30,
                                )),
                                dropdownColor: Colors.white,
                                enableFeedback: true,
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
                                            style:
                                                const TextStyle(fontSize: 24),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (String? index2) {
                                  setState(() {
                                    dropDownIndexLanguage = index2;

                                    LocalizationChecker.changeLanguge(
                                        context, dropDownIndexLanguage!);
                                  });
                                },
                                value: dropDownIndexLanguage ?? 'English',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.key,
                            size: 28,
                          ),
                          title: TextButton(
                            onPressed: () {
                              _openChangePassword();
                            },
                            child: const Align(
                              alignment: Alignment(-1.2, 0),
                              child: Text(
                                'Change password',
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const ListTile(
                          leading: Icon(
                            Icons.logout,
                            size: 30,
                          ),
                          title: Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Card(
              elevation: 10,
              margin: EdgeInsets.only(
                top: 15,
                left: 35,
                right: 35,
                bottom: MediaQuery.of(context).size.height * 0.40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 220,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      child: Image.asset('assets/images/user.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Suman Devkota',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'suman.yhhits@gmail.com',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  void _openChangePassword() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Password'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.77,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Current Password',
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                  ),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm New Password',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'SAVE',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
