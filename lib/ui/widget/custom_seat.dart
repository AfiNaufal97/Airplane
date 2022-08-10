import 'package:airplane_app/cubit/seat_cubit.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:flutter/material.dart';

class CustomSeat extends StatelessWidget {
  final bool status;
  final String id;
  CustomSeat({this.status = true, required this.id});

  @override
  Widget build(BuildContext context) {
    bool result = context.watch<SeatCubit>().setSeat(id);

    Color colorBorder(bool status) {
      if (!status) {
        return greyColor;
      } else {
        return purpleColor;
      }
    }

    Color colorSeat(bool status) {
      if (!status) {
        return greyColor;
      } else {
        if (result) {
          return lightPurpleColor;
        } else {
          return purpleColor;
        }
      }
    }

    Widget setText(bool status) {
      if (!status) {
        return Text('');
      } else {
        if (result) {
          return Text('');
        } else {
          return Center(
            child: Text(
              'You',
              style: textWhite,
            ),
          );
        }
      }
    }

    return GestureDetector(
      onTap: () {
        if (status) {
          context.read<SeatCubit>().chooseSeat(id);
        }

        print('hallo');
      },
      child: Container(
          width: 48,
          height: 48,
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(width: 2, color: colorBorder(status)),
              color: colorSeat(status)),
          child: setText(status)),
    );
  }
}
