import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talaash/user_account/success_page.dart';
import 'package:talaash/utils/colors.dart';
import 'package:talaash/widgets/header_container.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
//https://www.youtube.com/watch?v=G9VDqDAA3ME
//https://www.youtube.com/watch?v=Xgt6xCFQ4yA
// ignore: depend_on_referenced_packages
// import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:http/http.dart' as http;

class OtpPage extends StatefulWidget {
  final String number;
  final String email;
  const OtpPage(
      {required this.number, required this.email, String? userName, Key? key})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<OtpPage> createState() => _OtpPageState(number, email);
}

class _OtpPageState extends State<OtpPage> {
  bool isFinished = false;

  late String p1;
  late String p2;
  late String p3;
  late String p4;
  late String p5;
  late String p6;
  bool isActive = false;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  _OtpPageState(String number, String email);

  String get number => widget.number;
  String get email => widget.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 20),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: HeaderContainer("T A L A A S H")),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            child: const Center(
                              child: Text(
                                "Please enter the OTP",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: const Center(
                              child: Text(
                                "sent to the registered mobile number",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: Center(
                              child: Text(
                                number,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            alignment: Alignment.center,
                            child: Form(
                              key: _formKey,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 30,
                                    height: 40,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          _formKey.currentState?.save();
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      onSaved: (ip1) {
                                        setState(() {
                                          p1 = ip1!;
                                        });
                                      },
                                      decoration:
                                          const InputDecoration(hintText: "0"),
                                      // ignore: deprecated_member_use
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    height: 40,
                                    child: TextFormField(
                                      onSaved: (ip2) {
                                        setState(() {
                                          p2 = ip2!;
                                        });
                                      },
                                      decoration:
                                          const InputDecoration(hintText: "0"),
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          _formKey.currentState?.save();
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    height: 40,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          _formKey.currentState?.save();
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      onSaved: (ip3) {
                                        setState(() {
                                          p3 = ip3!;
                                        });
                                      },
                                      decoration:
                                          const InputDecoration(hintText: "0"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    height: 40,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          _formKey.currentState?.save();
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      onSaved: (ip4) {
                                        setState(() {
                                          p4 = ip4!;
                                        });
                                      },
                                      decoration:
                                          const InputDecoration(hintText: "0"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    height: 40,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          _formKey.currentState?.save();
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      onSaved: (ip5) {
                                        setState(() {
                                          p5 = ip5!;
                                        });
                                      },
                                      decoration:
                                          const InputDecoration(hintText: "0"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    height: 40,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          _formKey.currentState?.save();
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      onSaved: (ip6) {
                                        setState(() {
                                          p6 = ip6!;
                                        });
                                      },
                                      decoration:
                                          const InputDecoration(hintText: "0"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            alignment: Alignment.center,
                            child: const Center(
                              child: Text(
                                textDirection: TextDirection.ltr,
                                "",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 25),
                              child: Column(children: [
                                TextButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        optVerify();
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
                                    child: const Text('Verify OTP')),
                                // SwipeableButtonView(
                                //     buttonColor:
                                //         const Color.fromARGB(255, 14, 82, 18),
                                //     buttonText: "Swipe to Proceed",
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
                                //     isActive: isActive,
                                //     onWaitingProcess: () {
                                //       Future.delayed(const Duration(seconds: 1), () {
                                //         setState(() {
                                //           isFinished = true;
                                //         });
                                //       });
                                //     },
                                //     onFinish: () {
                                //       Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   const SuccessPage()));

                                //       setState(() {
                                //         isFinished = false;
                                //       });
                                //     })
                              ])),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Future optVerify() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      // Fluttertoast.showToast(
      //     msg: "OTP is being verified. Please wait..",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.TOP,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      String otp = p1 + p2 + p3 + p4 + p5 + p6;
      final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
      final requestPayload = json.encode(
          {"mobileNumber": number, "oneTimePassword": otp, "userEmail": email});
      http.Response response;
      response = await http.post(
          Uri.parse('http://3.6.87.138:9001/users/otp/verify'),
          headers: headers,
          body: requestPayload);
      json.decode(response.body);
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200) {
        // setState(() {
        //   isFinished = true;
        // });
        setState(() {
          isActive = true;
        });
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SuccessPage()));

        Fluttertoast.showToast(
            msg: jsonResponse['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff7f9e7e),
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          _isLoading = false;
        });
        return;
      } else {
        setState(() {
          _isLoading = false;
        });
        Fluttertoast.showToast(
            msg: jsonResponse['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff7f9e7e),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(
          msg: "Please enter valid otp..",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff7f9e7e),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  // setState(() {
  //   isFinished = false;
  // });
}
