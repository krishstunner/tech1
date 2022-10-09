// ignore_for_file: unused_import, use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talaash/user_account/otp_page.dart';
import 'package:talaash/utils/userinfo_page.dart';
import 'package:talaash/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:country_picker/country_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
import 'package:swipeable_button_view/swipeable_button_view.dart';

late Map mapResponse;

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  bool isFinished = false;
  bool isActive = false;
  String userName = '';
  String userEmail = '';
  String conformEmail = '';
  String password = '';
  String confirmPassword = '';
  String mobileNumber = '';
  String countryOfEducation = '';
  String schoolName = '';
  String? schoolPassedOutYear;
  String? educationLevel;

  String userNameError = '';
  String userEmailError = '';
  String conformEmailError = '';
  String passwordError = '';
  String confirmPasswordError = '';
  String mobileNumberError = '';
  String countryOfEducationError = '';
  String schoolNameError = '';
  String? schoolPassedOutYearError;
  String? educationLevelError;
  String spaces = "       ";

  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final countryPicker = const FlCountryCodePicker(showSearchBar: true);
  CountryCode? countryCode;

  static const List<String> EducationLevelList = <String>[
    'KG',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    'Diploma',
    'Graduation',
    'Post Graduation',
  ];

  static const List<String> PassedOutYearList = <String>[
    "1900",
    "1901",
    "1902",
    "1903",
    "1904",
    "1905",
    "1906",
    "1907",
    "1908",
    "1909",
    "1910",
    "1911",
    "1912",
    "1913",
    "1914",
    "1915",
    "1916",
    "1917",
    "1918",
    "1919",
    "1920",
    "1921",
    "1922",
    "1923",
    "1924",
    "1925",
    "1926",
    "1927",
    "1928",
    "1929",
    "1930",
    "1931",
    "1932",
    "1933",
    "1934",
    "1935",
    "1936",
    "1937",
    "1938",
    "1939",
    "1940",
    "1941",
    "1942",
    "1943",
    "1944",
    "1945",
    "1946",
    "1947",
    "1948",
    "1949",
    "1950",
    "1951",
    "1952",
    "1953",
    "1954",
    "1955",
    "1956",
    "1957",
    "1958",
    "1959",
    "1960",
    "1961",
    "1962",
    "1963",
    "1964",
    "1965",
    "1966",
    "1967",
    "1968",
    "1969",
    "1970",
    "1971",
    "1972",
    "1973",
    "1974",
    "1975",
    "1976",
    "1977",
    "1978",
    "1979",
    "1980",
    "1981",
    "1982",
    "1983",
    "1984",
    "1985",
    "1986",
    "1987",
    "1988",
    "1989",
    "1990",
    "1991",
    "1992",
    "1993",
    "1994",
    "1995",
    "1996",
    "1997",
    "1998",
    "1999",
    "2000",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024"
  ];

  Future onRegister() async {
    setState(() {
      _isLoading = true;
    });
    // Fluttertoast.showToast(
    //     msg: "User is being registered. Please wait..",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.TOP,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.green,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
    String? dialCode = countryCode!.dialCode;
    // log(jsonEncode(countryCode['']));
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final requestPayload = json.encode({
      "userName": userName,
      "userEmail": userEmail,
      "password": password,
      "mobileNumber": mobileNumber,
      "mobileCountryCode": dialCode,
      "educationInformation": [
        {
          "countryOfEducation": countryOfEducation,
          "schoolName": schoolName,
          "schoolPassedOutYear": int.parse(schoolPassedOutYear!),
          "educationLevel": educationLevel
        }
      ]
    });

    http.Response response;
    response = await http.post(
        Uri.parse('http://3.6.87.138:9001/users/register'),
        headers: headers,
        body: requestPayload);

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    // var itemCount = jsonResponse['totalItems'];
    // print('Number of books about http: $itemCount.');
    // var convertDataToJson = json.decode(response.body);
    // var data = convertDataToJson['results'];

    // ignore: avoid_print
    // if (response.error) {
    //   Fluttertoast.showToast(
    //       msg: "Please check the values entered",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.TOP,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    //   return;
    // } else
    if (response.statusCode == 200) {
      setState(() {
        isActive = true;
      });
      Fluttertoast.showToast(
          msg: "User registered successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff7f9e7e),
          textColor: Colors.white,
          fontSize: 16.0);
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpPage(
                    email: userEmail,
                    number: mobileNumber,
                  )));
      // setState(() {
      //   mapResponse = jsonDecode(response.body);
      // });
      // setState(() {
      //   isFinished = true;
      // });
      setState(() {
        _isLoading = false;
      });
      return;
    } else {
      // String error = response.statusCode.toString();
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
    }
    // else {
    //   await Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => const RegPage()));
    // }
    // setState(() {
    //   isFinished = false;
    // });
    // log(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: greenColors,
        title: const Text("User Registration",
            style: TextStyle(color: Colors.white)),
        leading: Image.asset(
          "assets/logo.png",
          alignment: Alignment.center,
          scale: 3,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
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
                : Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            _textInput(
                                name: 'Name',
                                hint: "Enter your Name as in Alma mater"),
                            _textInput(
                                name: 'Email',
                                hint: "Enter your Email address"),
                            _textInput(
                                name: 'ConformEmail',
                                hint: "Re-enter your Email address"),
                            _textInput(
                                name: 'Password',
                                hint: "Password (8-12 characters)"),
                            _textInput(
                                name: 'ConfirmPassword',
                                hint: "Re-enter password"),
                            _textInput(name: 'Mobile', hint: "Mobile Number"),
                            _textInput(
                                name: 'EducationCountry',
                                hint: "Country of your Alma Mater"),
                            _textInput(
                                name: 'SchoolName',
                                hint: "Name of the Institution "),
                            _textInput(
                                name: 'LastYear',
                                hint: "Final year of Education"),
                            _textInput(
                                name: 'EducationLevel',
                                hint: "Level of Education"),
                            const SizedBox(
                              width: 5,
                              height: 5,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 25),
                                child: Column(children: [
                                  TextButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          onRegister();
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
                                      child: const Text('Register')),
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
                                  //     isActive: isActive,
                                  //     isFinished: isFinished,
                                  //     onWaitingProcess: () {
                                  //       Future.delayed(const Duration(seconds: 1),
                                  //           () {
                                  //         setState(() {
                                  //           isFinished = true;
                                  //         });
                                  //       });
                                  //     },
                                  //     onFinish: () async {
                                  //       await Navigator.push(
                                  //           context,
                                  //           MaterialPageRoute(
                                  //               builder: (context) => OtpPage(
                                  //                     email: userEmail,
                                  //                     number: mobileNumber,
                                  //                   )));

                                  //       setState(() {
                                  //         isFinished = false;
                                  //       });
                                  //     }),
                                ]))
                          ],
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Widget _textInput({controller, hint, icon, required String name}) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 8, bottom: 5),
        child: name == "Mobile"
            ? Row(
                children: [
                  SizedBox(
                      child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () async {
                            final code = await countryPicker.showPicker(
                                context: context);
                            if (code != null) {
                              setState(() {
                                countryCode = code;
                              });
                            }
                          },
                          child: Row(children: [
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                color: greenColors,
                                // ignore: prefer_null_aware_operators
                                child: countryCode != null
                                    ? countryCode?.flagImage
                                    : null),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              child: Text(countryCode?.dialCode ?? '+91',
                                  style: const TextStyle(color: Colors.black)),
                            ),
                          ]))),
                  Expanded(
                      child: TextFormField(
                    controller: controller,
                    onChanged: (text) {
                      handleTextChange(text, name);
                    },
                    obscureText: name == 'Password'
                        ? _isObscurePassword
                        : false || name == 'ConfirmPassword'
                            ? _isObscureConfirmPassword
                            : false,
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8}$');
                      // RegExp regexMobile = RegExp(r'^(?=.*[0-9].{10,}$)');

                      if (name == 'Mobile' && value!.isEmpty) {
                        return 'Please enter Mobile Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                        prefixIcon:
                            name != 'MobileCountryCode' ? Icon(icon) : null,

                        //  Container(
                        //     child: Row(children: [
                        //       Container(
                        //           decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               borderRadius: BorderRadius.circular(5)))
                        //     ]),
                        //   )

                        suffixIcon: name == 'Password'
                            ? (IconButton(
                                icon: Icon(
                                  _isObscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscurePassword = !_isObscurePassword;
                                  });
                                },
                              ))
                            : name == 'ConfirmPassword'
                                ? (IconButton(
                                    icon: Icon(
                                      _isObscureConfirmPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscureConfirmPassword =
                                            !_isObscureConfirmPassword;
                                      });
                                    },
                                  ))
                                : null),
                  ))
                ],
              )
            : name == 'LastYear'
                ? DropdownButtonFormField<String>(
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(icon),
                    ),
                    hint: Text(hint),
                    isExpanded: true,
                    validator: (value) => value == null
                        ? 'Please fill Final year of Education '
                        : null,
                    value: schoolPassedOutYear,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        schoolPassedOutYear = value!;
                      });
                    },
                    items: PassedOutYearList.map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList())
                : name == 'EducationLevel'
                    ? DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(icon),
                        ),
                        hint: Text(hint),
                        validator: (value) => value == null
                            ? 'Please fill Level of Education '
                            : null,
                        isExpanded: true,
                        value: educationLevel,
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            educationLevel = value ?? "";
                          });
                        },
                        items: EducationLevelList.map<DropdownMenuItem<String>>(
                            (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    : TextFormField(
                        controller: controller,
                        onChanged: (text) {
                          handleTextChange(text, name);
                        },
                        obscureText: name == 'Password'
                            ? _isObscurePassword
                            : false || name == 'ConfirmPassword'
                                ? _isObscureConfirmPassword
                                : false,
                        validator: (value) {
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,20}$');
                          // RegExp regexMobile = RegExp(r'^(?=.*[0-9].{10,}$)');

                          if (name == 'Name' && value!.isEmpty) {
                            return 'Please enter name';
                          }

                          if (name == 'Email' && value!.isEmpty) {
                            return 'Please enter email';
                          }

                          if (name == 'Email' &&
                              !EmailValidator.validate(value!)) {
                            return 'Please enter valid email';
                          }

                          if (name == 'ConformEmail' &&
                              !EmailValidator.validate(value!)) {
                            return 'Please enter valid email';
                          }

                          if (name == 'ConformEmail' &&
                              regex.hasMatch(value!) &&
                              value != userEmail) {
                            return 'Email not matched';
                          }

                          if (name == 'Password' && !regex.hasMatch(value!)) {
                            return 'Please Enter 8-10 characters with Alphanumeric characters.';
                          }

                          if (name == 'ConfirmPassword' &&
                              !regex.hasMatch(value!)) {
                            return 'Please Enter 8-10 characters with Alphanumeric characters.';
                          }

                          if (name == 'ConfirmPassword' &&
                              regex.hasMatch(value!) &&
                              value != password) {
                            return 'Password not matched';
                          }

                          if (name == 'Mobile' && value!.isEmpty) {
                            return 'Please enter Mobile Number';
                          }

                          // if (name == 'Mobile' && !regexMobile.hasMatch(value!)) {
                          //   return 'Please enter valid Mobile Number';
                          // }

                          if (name == 'EducationCountry' && value!.isEmpty) {
                            return 'Please enter Education Country';
                          }

                          if (name == 'SchoolName' && value!.isEmpty) {
                            return 'Please enter School Name';
                          }

                          if (name == 'LastYear' && value!.isEmpty) {
                            return 'Please enter Last Year of Education';
                          }

                          if (name == 'EducationLevel' && value!.isEmpty) {
                            return 'Please enter EducationLevel';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hint,
                            prefixIcon:
                                name != 'MobileCountryCode' ? Icon(icon) : null,

                            //  Container(
                            //     child: Row(children: [
                            //       Container(
                            //           decoration: BoxDecoration(
                            //               color: Colors.white,
                            //               borderRadius: BorderRadius.circular(5)))
                            //     ]),
                            //   )

                            suffixIcon: name == 'Password'
                                ? (IconButton(
                                    icon: Icon(
                                      _isObscurePassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscurePassword =
                                            !_isObscurePassword;
                                      });
                                    },
                                  ))
                                : name == 'ConfirmPassword'
                                    ? (IconButton(
                                        icon: Icon(
                                          _isObscureConfirmPassword
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isObscureConfirmPassword =
                                                !_isObscureConfirmPassword;
                                          });
                                        },
                                      ))
                                    : null),
                      ));
  }

  void handleTextChange(String text, String name) {
    if (name == 'Name') {
      setState(() {
        userName = text;
      });
    } else if (name == 'Email') {
      setState(() {
        userEmail = text;
      });
    } else if (name == 'ConformEmail') {
      setState(() {
        conformEmail = text;
      });
    } else if (name == 'Password') {
      setState(() {
        password = text;
      });
    } else if (name == 'ConfirmPassword') {
      setState(() {
        confirmPassword = text;
      });
    } else if (name == 'Mobile') {
      setState(() {
        mobileNumber = text;
      });
    } else if (name == 'EducationCountry') {
      setState(() {
        countryOfEducation = text;
      });
    } else if (name == 'SchoolName') {
      setState(() {
        schoolName = text;
      });
    } else if (name == 'LastYear') {
      setState(() {
        schoolPassedOutYear = text;
      });
    } else if (name == 'EducationLevel') {
      setState(() {
        educationLevel = text;
      });
    }
  }
}
