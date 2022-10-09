// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:talaash/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var btnText;
  var onClick;

  ButtonWidget({super.key, this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: greenLightColors,
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 20, color: greenColors, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
