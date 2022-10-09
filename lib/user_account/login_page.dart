import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talaash/utils/colors.dart';
import 'package:talaash/widgets/header_container.dart';
import 'package:talaash/home_page/newsfeed_page.dart';
import 'package:http/http.dart' as http;

// import 'package:swipeable_button_view/swipeable_button_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isFinished = false;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? username = '';
  String? password = '';

  Future onLogin() async {
    setState(() {
      _isLoading = true;
    });

    // log(jsonEncode(countryCode['']));
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final requestPayload =
    json.encode({"userEmail": username, "password": password});

    http.Response response;
    response = await http.post(Uri.parse('http://3.6.87.138:9001/users/login'),
        headers: headers, body: requestPayload);

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "User loggedIn successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff7f9e7e),
          textColor: Colors.white,
          fontSize: 16.0);
      // ignore: use_build_context_synchronously
      await Navigator.push(context,
          MaterialPageRoute(builder: (context) => const NewsFeedPage()));
      setState(() {
        _isLoading = false;
      });
      return;
    } else if (jsonResponse['message'] == "Invalid user credentials") {
      Fluttertoast.showToast(
          msg: jsonResponse['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff7f9e7e),
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        _isLoading = false;
      });
      return;
    } else if (jsonResponse['message'] ==
        "Please verify email before logging in") {
      Fluttertoast.showToast(
          msg: jsonResponse['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff7f9e7e),
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        _isLoading = false;
      });
      return;
    } else if (jsonResponse['status'] == 500) {
      Fluttertoast.showToast(
          msg: 'Enter email and password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff7f9e7e),
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        _isLoading = false;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 50),
        child: _isLoading
            ? Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: const Center(
              child: SpinKitCircle(
                color: Color(0xff7f9e7e),
                size: 50.0,
              )),
        )
            : Column(
          children: <Widget>[
            Center(child: HeaderContainer("Welcome to Talaash")),
            Expanded(
              flex: 1,
              child: Container(
                margin:
                const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint: "Email", name: 'username'),
                    _textInput(hint: "Password", name: 'password'),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: greenColors,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      alignment: Alignment.center,
                      child: const Center(
                        child: Text(
                          "By swiping to Login, you agree to Talaash's Terms of Service",
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 42),
                      alignment: Alignment.centerRight,
                      child: const Center(
                        child: Text(
                          "and acknowledge you've read our Privacy Policy",
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 25),
                        child: Form(
                          key: _formKey,
                          child: TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  onLogin();
                                }
                              },
                              style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.white),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      greenColors),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          side: const BorderSide(
                                              color: Colors.green)))),
                              child: const Text('Login')),

                          //  SwipeableButtonView(
                          //     buttonColor: const Color.fromARGB(255, 14, 82, 18),
                          //     buttonText: "Swipe to Login",
                          //     buttontextstyle: const TextStyle(
                          //         color: Color.fromARGB(255, 14, 82, 18),
                          //         letterSpacing: 2,
                          //         fontWeight: FontWeight.bold),
                          //     // ignore: avoid_unnecessary_containers
                          //     buttonWidget: Container(
                          //       child: const Icon(
                          //         Icons.circle,
                          //         color: Color.fromRGBO(66, 131, 68, 1),
                          //       ),
                          //     ),
                          //     activeColor: greenLightColors,
                          //     isFinished: isFinished,
                          //     onWaitingProcess: () {
                          //       Future.delayed(const Duration(seconds: 2), () {
                          //         setState(() {
                          //           isFinished = true;
                          //         });
                          //       });
                          //     },
                          //     onFinish: () {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => const RegPage()));

                          //       setState(() {
                          //         isFinished = false;
                          //       });
                          //     })
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon, required String name}) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 0.1,
            offset: Offset(1,1),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 5),
      child: TextFormField(
        validator: (value) {
          if (name == 'username' && value!.isEmpty) {
            return 'Please enter username';
          }
          if (name == 'password' && value!.isEmpty) {
            return 'Please enter password';
          }
          return null;
        },
        onChanged: (text) {
          handleTextChange(text, name);
        },
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  void handleTextChange(String text, String name) {
    if (name == 'username') {
      setState(() {
        username = text;
      });
    } else if (name == 'password') {
      setState(() {
        password = text;
      });
    }
  }
}

