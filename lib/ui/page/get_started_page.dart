import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:airplane_app/ui/widget/button_purple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        'Fly Like a Bird',
        style: textWhite.copyWith(fontSize: 32, fontWeight: semiBold),
      );
    }

    Widget about() {
      return Text(
        'Explore new world with us and let\nyourself get an amazing experiences',
        style: textWhite.copyWith(fontSize: 16, fontWeight: light),
        textAlign: TextAlign.center,
      );
    }

    Widget buttonMain() {
      return ButtonPurple(
          text: 'Get Started',
          function: () {
            Navigator.pushNamed(context, '/signUp');
          });
    }

    Widget columnText() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            title(),
            SizedBox(
              height: 10,
            ),
            about(),
            SizedBox(
              height: 50,
            ),
            buttonMain(),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      );
    }

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/imageSplash.png'))),
        ),
        columnText()
      ],
    ));
  }
}
