import 'package:airplane_app/cubit/page_cubit.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:airplane_app/ui/page/setting_page.dart';
import 'package:airplane_app/ui/page/wallet_page.dart';
import 'package:airplane_app/ui/widget/button_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_page.dart';
import 'home_page.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget containerButtonMenu() {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width - (2 * 24),
            height: 55,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(borderRadius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonMenu(
                  nameImage: 'images/home.png',
                  index: 0,
                ),
                ButtonMenu(
                  nameImage: 'images/booking.png',
                  index: 1,
                ),
                ButtonMenu(
                  nameImage: 'images/creditCard.png',
                  index: 2,
                ),
                ButtonMenu(
                  nameImage: 'images/setting.png',
                  index: 3,
                )
              ],
            ),
          ));
    }

    Widget setPage(int index) {
      switch (index) {
        case 0:
          return HomePage();
        case 1:
          return Book();
        case 2:
          return Wallet();
        case 3:
          return Setting();
        default:
          return HomePage();
      }
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, int) => Scaffold(
        body: Stack(
          children: [setPage(int), containerButtonMenu()],
        ),
      ),
    );
  }
}
