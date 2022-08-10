import 'package:airplane_app/cubit/page_cubit.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonMenu extends StatelessWidget {
  String nameImage;

  int index;
  ButtonMenu({required this.nameImage, required this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().replacePage = index;
      },
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(),
        Image.asset(
          nameImage,
          width: 24,
          height: 24,
          color: context.read<PageCubit>().state == index
              ? purpleColor
              : greyColor,
        ),
        Container(
          height: 2,
          width: 30,
          decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? purpleColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius)),
        )
      ]),
    );
  }
}
