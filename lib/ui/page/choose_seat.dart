import 'package:airplane_app/cubit/seat_cubit.dart';
import 'package:airplane_app/models/destinatons_model.dart';
import 'package:airplane_app/models/transaction.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:airplane_app/ui/page/detail_pay.dart';
import 'package:airplane_app/ui/widget/button_purple.dart';
import 'package:airplane_app/ui/widget/custom_seat.dart';
import 'package:airplane_app/ui/widget/icon_avaible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChoosePage extends StatelessWidget {
  final DestinationsModel destinationsModel;
  ChoosePage({required this.destinationsModel});

  @override
  Widget build(BuildContext context) {
    Widget titleChoose() {
      return Text(
        'Select Your\nFavorite Seat',
        style: textBlack.copyWith(fontSize: 24, fontWeight: semiBold),
      );
    }

    // TODO: About Status Seat Top
    Widget rowStatusSeat() {
      return Row(
        children: [
          IconAvilable(
              borderIn: purpleColor,
              main: lightPurpleColor,
              textIn: 'Available'),
          IconAvilable(
              borderIn: purpleColor, main: purpleColor, textIn: 'Selected'),
          IconAvilable(
              borderIn: greyUnvailbleColor,
              main: greyUnvailbleColor,
              textIn: 'Unavailable')
        ],
      );
    }

    // TODO:Detail Seat Choose
    Widget yourSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) => Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your seat',
                    style: textGrey.copyWith(fontSize: 14, fontWeight: light),
                  ),
                  Text(
                    state.join(', '),
                    style: textBlack.copyWith(fontSize: 16, fontWeight: medium),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                      style:
                          textGrey.copyWith(fontSize: 14, fontWeight: light)),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', name: 'IDR ', decimalDigits: 0)
                        .format(state.length * destinationsModel.price),
                    style:
                        textPurple.copyWith(fontSize: 16, fontWeight: semiBold),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget sectionSeat() {
      return Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'A',
              style: textGrey.copyWith(fontSize: 16, fontWeight: regular),
            ),
            Text(
              'B',
              style: textGrey.copyWith(fontSize: 16, fontWeight: regular),
            ),
            Container(),
            Text(
              'C',
              style: textGrey.copyWith(fontSize: 16, fontWeight: regular),
            ),
            Text(
              'D',
              style: textGrey.copyWith(fontSize: 16, fontWeight: regular),
            )
          ],
        ),
      );
    }

    // TODO: Contaner Seat
    Widget containerSeat() {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Column(
          children: [
            sectionSeat(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomSeat(
                  id: '1A',
                ),
                CustomSeat(
                  id: '1B',
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(child: Text('1')),
                ),
                CustomSeat(
                  id: '1C',
                ),
                CustomSeat(
                  id: '1D',
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomSeat(
                  status: false,
                  id: '2A',
                ),
                CustomSeat(
                  status: false,
                  id: '2B',
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(child: Text('2')),
                ),
                CustomSeat(
                  id: '2C',
                ),
                CustomSeat(
                  id: '2D',
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomSeat(
                  id: '3A',
                ),
                CustomSeat(
                  id: '3B',
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(child: Text('3')),
                ),
                CustomSeat(
                  id: '3C',
                ),
                CustomSeat(
                  id: '3D',
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomSeat(
                  id: '4A',
                ),
                CustomSeat(
                  id: '4B',
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(child: Text('4')),
                ),
                CustomSeat(
                  id: '4C',
                ),
                CustomSeat(
                  id: '4D',
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomSeat(
                  id: '5A',
                ),
                CustomSeat(
                  id: '5B',
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(child: Text('5')),
                ),
                CustomSeat(
                  id: '5C',
                ),
                CustomSeat(
                  id: '5D',
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            yourSeat()
          ],
        ),
      );
    }

    // TODO: Contaner Choose
    Widget containerChoose() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) => Container(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleChoose(),
                SizedBox(
                  height: 16,
                ),
                rowStatusSeat(),
                containerSeat(),
                SizedBox(
                  height: 30,
                ),
                ButtonPurple(
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPay(
                                destinationsModel: destinationsModel,
                                transaction: Transaction(
                                  imageUrl: destinationsModel.imageUrl,
                                  nameDestination: destinationsModel.name,
                                  city: destinationsModel.city,
                                  rating: destinationsModel.rating,
                                  travaler: state.length,
                                  seat: state.join(', '),
                                  insurance: false,
                                  refundable: false,
                                  vat: 45,
                                  price: (destinationsModel.price).toInt() *
                                      state.length,
                                ))));
                  },
                  width: MediaQuery.of(context).size.width,
                  text: 'Pay Now',
                ),
                SizedBox(
                  height: 46,
                )
              ],
            ),
          ),
        ),
      );
    }

    // TODO: implement build
    return Scaffold(body: SafeArea(child: containerChoose()));
  }
}
