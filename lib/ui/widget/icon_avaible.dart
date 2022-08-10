import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:flutter/material.dart';

class IconAvilable extends StatelessWidget {
  Color main;
  Color borderIn;
  String textIn;
  IconAvilable(
      {required this.borderIn, required this.main, required this.textIn});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                color: main,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: borderIn)),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            textIn,
            style: textBlack.copyWith(fontSize: 14, fontWeight: regular),
          )
        ],
      ),
    );
  }
}
