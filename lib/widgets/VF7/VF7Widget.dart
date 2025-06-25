import 'package:flutter/material.dart';

Widget getName(String? introduction, {double fontSize = 26, Color? color}) {
  return introduction == null
      ? const SizedBox()
      : Text(
          introduction,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: color ?? Colors.black,
          ),
        );
}
