// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:talaash/user_account/login_page.dart';
import 'package:talaash/utils/colors.dart';
import 'package:talaash/user_account/regi_page.dart';
// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../widgets/header_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFinishedRegister = false;
  bool isFinishedLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: greenColors,
      body: Container(
//          color: greenColors,
        padding: const EdgeInsets.only(top: 30, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: HeaderContainer("T A L A A S H")),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                child: SwipeableButtonView(
                    buttonColor: const Color.fromARGB(255, 14, 82, 18),
                    buttonText: "Swipe to Register",
                    buttontextstyle: const TextStyle(
                        color: Color.fromARGB(255, 14, 82, 18),
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold),
                    // ignore: avoid_unnecessary_containers
                    buttonWidget: Container(
                      child: const Icon(
                        Icons.circle,
                        color: Color.fromRGBO(66, 131, 68, 1),
                      ),
                    ),
                    activeColor: greenLightColors,
                    isFinished: isFinishedRegister,
                    onWaitingProcess: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          isFinishedRegister = true;
                        });
                      });
                    },
                    onFinish: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const RegPage();
                      }));

                      setState(() {
                        isFinishedRegister = false;
                      });
                    })),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                child: SwipeableButtonView(
                    buttonColor: const Color.fromARGB(255, 14, 82, 18),
                    buttonText: "Swipe to Login",
                    buttontextstyle: const TextStyle(
                        color: Color.fromARGB(255, 14, 82, 18),
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold),
                    // ignore: avoid_unnecessary_containers
                    buttonWidget: Container(
                      child: const Icon(
                        Icons.circle,
                        color: Color.fromRGBO(66, 131, 68, 1),
                      ),
                    ),
                    activeColor: greenLightColors,
                    isFinished: isFinishedLogin,
                    onWaitingProcess: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          isFinishedLogin = true;
                        });
                      });
                    },
                    onFinish: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginPage();
                      }));

                      setState(() {
                        isFinishedLogin = false;
                      });
                    })),
            const SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.center,
              // ignore: prefer_const_constructors
              child: Center(
                child: Text(
                  "Powered by",
                  style: TextStyle(
                      color: Colors.green.shade200,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              // padding: const EdgeInsets.only(bottom: 50),
              // margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              // ignore: prefer_const_constructors
              child: Center(
                child: Text(
                  "FRIENDSONOMY",
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
