import 'package:flutter/material.dart';

import '../utils/colors.dart';

class FriendsZonePage extends StatefulWidget {
  const FriendsZonePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FriendsZonePagetState createState() => _FriendsZonePagetState();
}

class _FriendsZonePagetState extends State<FriendsZonePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: greenColors,
              padding: const EdgeInsets.all(24),
            ),
            child: Image.asset(
              "assets/group.png",
              color: Colors.white,
              height: 150,
              width: 150,
            ),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: greenColors,
              padding: const EdgeInsets.all(24),
            ),
            child: Image.asset(
              "assets/forum.png",
              color: Colors.white,
              height: 150,
              width: 150,
            ),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: greenColors,
              padding: const EdgeInsets.all(24),
            ),
            child: Image.asset(
              "assets/graduates.png",
              color: Colors.white,
              height: 150,
              width: 150,
            ),
          ),
        )
      ],
    );
  }
}
