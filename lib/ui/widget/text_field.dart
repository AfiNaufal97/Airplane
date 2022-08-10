import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  String text;
  String hint;
  bool dontRead;
  TextEditingController controller;

  TextFields(
      {required this.text,
      required this.hint,
      this.dontRead = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: textBlack.copyWith(fontSize: 14, fontWeight: regular),
          ),
          SizedBox(
            height: 6,
          ),
          TextField(
            cursorColor: blackColor,
            style: textBlack,
            controller: controller,
            obscureText: dontRead,
            decoration: InputDecoration(
                hintText: hint,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: purpleColor, width: 2)),
                hintStyle: textGrey,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: blackColor, width: 2))),
          )
        ],
      ),
    );
  }
}
