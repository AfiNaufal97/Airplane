import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:airplane_app/ui/widget/button_purple.dart';
import 'package:flutter/material.dart';

class SuccesCheckout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget imageSucces() {
      return Image.asset(
        'images/scheduling.png',
        width: 300,
        height: 150,
      );
    }

    Widget containerText() {
      return Container(
        margin: EdgeInsets.only(top: 80, bottom: 50),
        child: Column(
          children: [
            Text(
              'Well Booked 😍',
              style: textBlack.copyWith(fontSize: 32, fontWeight: semiBold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Are you ready to explore the new\nworld of experiences?',
              textAlign: TextAlign.center,
              style: textGrey.copyWith(fontSize: 16, fontWeight: light),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageSucces(),
            containerText(),
            ButtonPurple(
                text: 'My Bookings', width: 220, height: 55, function: () {})
          ],
        ),
      )),
    );
  }
}
