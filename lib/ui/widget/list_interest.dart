import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:flutter/cupertino.dart';

class ListInterest extends StatelessWidget {
  String text;
  String inputText;

  ListInterest({required this.text, this.inputText = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            'images/check.png',
            width: 16,
            height: 16,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: textBlack.copyWith(fontSize: 14, fontWeight: regular),
          ),
        ],
      ),
    );
  }
}
