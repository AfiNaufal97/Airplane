import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/cubit/auth_state.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:airplane_app/ui/widget/button_purple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Saldo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget columnName() {
      return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        if (state is AuthSucces) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: textWhite.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${state.userModel.name}',
                style: textWhite.copyWith(fontSize: 20, fontWeight: medium),
              )
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: textWhite.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Kezia Anne',
                style: textWhite.copyWith(fontSize: 20, fontWeight: medium),
              )
            ],
          );
        }
      });
    }

    Widget columnBalance() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance',
            style: textWhite.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'IDR 280.000.000',
            style: textWhite.copyWith(fontSize: 26, fontWeight: medium),
          )
        ],
      );
    }

    Widget rowIconPay() {
      return Row(
        children: [
          Image.asset(
            'images/logo.png',
            width: 24,
            height: 24,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            'Pay',
            style: textWhite.copyWith(fontSize: 16, fontWeight: medium),
          )
        ],
      );
    }

    Widget rowFirstCard() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [columnName(), rowIconPay()],
      );
    }

    Widget containerCardSaldo() {
      return Container(
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width - (2 * 25),
          height: 211,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    lightPurpleColor.withGreen(1).withOpacity(0.7),
                    purpleColor
                  ]),
              color: purpleColor,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [rowFirstCard(), columnBalance()],
          ));
    }

    Widget containerText() {
      return Column(
        children: [
          Text(
            'Big Bonus 🎉',
            style: textBlack.copyWith(fontSize: 32, fontWeight: semiBold),
          ),
          SizedBox(height: 10),
          Text(
            'We give you early credit so that\nyou can buy a flight ticket',
            style: textBlack.copyWith(fontSize: 16, fontWeight: light),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    Widget startFly() {
      return ButtonPurple(
          text: 'Start Fly Now',
          function: () {
            Navigator.pushNamed(context, '/mainMenu');
          });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              containerCardSaldo(),
              SizedBox(
                height: 80,
              ),
              containerText(),
              SizedBox(height: 50),
              startFly(),
              SizedBox(
                height: 151,
              )
            ],
          ),
        ),
      ),
    );
  }
}
