import 'package:flutter/material.dart';
import 'package:yhhhamropokhara/core/extensions/color_extension.dart';
import 'package:yhhhamropokhara/features/models/data/color_fetch/colors_getter.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/bookmark.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/homepage.dart';
import 'package:yhhhamropokhara/features/screens/home_screen/profile.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  void onTapImplemented(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const BookmarkListing(),
    const HomeScreen(),
    const Profile(),
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_outlined,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: '',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 146, 138, 138),
        selectedFontSize: 0,
        currentIndex: _selectedIndex,
        backgroundColor: const Color.fromARGB(255, 234, 0, 0),
        onTap: onTapImplemented,
      ),
    );
  }
}
