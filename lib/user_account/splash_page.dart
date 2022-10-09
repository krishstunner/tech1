// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talaash/home_page/home_page.dart';
import 'package:talaash/utils/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(
          //context, MaterialPageRoute(builder: (context) => const OtpPage()));
          context,
          MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: greenColors,
        ),
        child: Center(
          child: Image.asset("assets/logo.png"),
        ),
      ),
    );
  }
}
