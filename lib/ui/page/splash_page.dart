import 'dart:async';

import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      FirebaseAuth user = FirebaseAuth.instance;
      if (user.currentUser == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/getStarted', (route) => false);
      } else {
        context.read<AuthCubit>().setUserByData(user.currentUser!.uid);
        Navigator.pushNamedAndRemoveUntil(
            context, '/mainMenu', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: purpleColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'AIRPLANE',
                style: textWhite.copyWith(
                    fontSize: 32, fontWeight: medium, letterSpacing: 10),
              ),
            ],
          ),
        ));
  }
}
