// NOTE: bagian title interest
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  String text;
  EdgeInsets? marginInput;
  EdgeInsets? paddingInput;
  TextTitle(
      {required this.text, this.marginInput = null, this.paddingInput = null});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginInput,
      padding: paddingInput,
      child: Text(
        text,
        style: textBlack.copyWith(fontSize: 16, fontWeight: semiBold),
      ),
    );
  }
}
