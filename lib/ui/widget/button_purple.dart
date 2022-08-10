import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {
  String text;
  double width;
  double height;
  double radius;
  void Function() function;
  ButtonPurple(
      {required this.text,
      this.width = 220,
      this.height = 55,
      this.radius = borderRadius,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
        child: ElevatedButton(
            style: ButtonStyle(
                shape:
                    MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
                backgroundColor: MaterialStateProperty.all<Color>(purpleColor)),
            onPressed: function,
            child: Text(text,
                style: textWhite.copyWith(fontSize: 18, fontWeight: medium))));
  }
}
