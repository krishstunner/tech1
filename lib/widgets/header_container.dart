import 'package:flutter/material.dart';
import 'package:talaash/utils/colors.dart';

// ignore: must_be_immutable
class HeaderContainer extends StatelessWidget {
  var text = "Welcome to Talaash";

  HeaderContainer(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(color: greenColors
          //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))
          ),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )),
          Center(
            child: Image.asset("assets/logo.png"),
          ),
        ],
      ),
    );
  }
}
