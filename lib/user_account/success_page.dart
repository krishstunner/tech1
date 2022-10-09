import 'package:flutter/material.dart';
import 'package:talaash/user_account/login_page.dart';
import 'package:talaash/utils/colors.dart';
import 'package:talaash/widgets/header_container.dart';

import 'package:swipeable_button_view/swipeable_button_view.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  bool isFinished = false;

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: HeaderContainer("T A L A A S H")),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          "Registration",
                          style: TextStyle(
                              color: greenColors,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          "Successful",
                          style: TextStyle(
                              color: greenColors,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: const Center(
                        child: Text(
                          "You will be ready to use Talaash",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: const Center(
                        child: Text(
                          "after confirming your email by",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: const Center(
                        child: Text(
                          "clicking the link send by Talaash Team",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      alignment: Alignment.center,
                      child: const Center(
                        child: Text(
                          textDirection: TextDirection.ltr,
                          "*This may take a few hours.",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 25),
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
                            isFinished: isFinished,
                            onWaitingProcess: () {
                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  isFinished = true;
                                });
                              });
                            },
                            onFinish: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));

                              setState(() {
                                isFinished = false;
                              });
                            })),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
