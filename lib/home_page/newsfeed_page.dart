import 'package:flutter/material.dart';
import 'package:talaash/home_page/friends_zone_page.dart';
import 'package:talaash/utils/userinfo.dart';
import 'package:talaash/utils/colors.dart';

// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  bool isFinished = false;

  int selectedIndex = 0;

  //list of widgets to call ontap
  final widgetOptions = [
    const ChatFragment(),
    const FriendsZonePage(),
    const ChatFragment(),
    const ChatFragment(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: greenColors,
          title: const Text("TALAASH",
              style: TextStyle(
                  color: Colors.white, letterSpacing: 2, fontSize: 16)),
          centerTitle: true,
        ),
        body: const Center(
          // child: widgetOptions.elementAt(selectedIndex), //New
        ),
        /*
       */
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onItemTapped,
          backgroundColor: greenColors,
          selectedItemColor: Colors.white,
          unselectedItemColor: greenLightColors,
          selectedFontSize: 14,
          currentIndex: selectedIndex,
          unselectedFontSize: 14,
          elevation: 10,
          iconSize: 40,
          mouseCursor: SystemMouseCursors.grab,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              label: "",
              icon: ImageIcon(
                AssetImage("assets/newspaper.png"),
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: ImageIcon(
                AssetImage("assets/high-five.png"),
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: ImageIcon(
                AssetImage("assets/store.png"),
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: ImageIcon(
                AssetImage("assets/career.png"),
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: ImageIcon(
                AssetImage("assets/user.png"),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
