import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColors,
        title: const Text("USER DETAILS",
            style:
                TextStyle(color: Colors.white, letterSpacing: 2, fontSize: 16)),
        centerTitle: true,
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: greenColors,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
          //https://bootcamp.uxdesign.cc/5-flutter-icons-package-for-your-daily-driver-24f93900e020
        },
        items: const [
          BottomNavigationBarItem(
            label: "tab1",
            icon: Icon(Icons.library_books),
          ),
          BottomNavigationBarItem(
            label: "tab1",
            icon: Icon(Icons.group),
          ),
          BottomNavigationBarItem(
            label: "tab1",
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            label: "tab1",
            icon: Icon(Icons.library_books),
          ),
        ],
      ),
    );
  }
}
