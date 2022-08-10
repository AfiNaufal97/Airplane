import 'package:airplane_app/models/destinatons_model.dart';
import 'package:airplane_app/models/transaction.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:airplane_app/ui/widget/button_purple.dart';
import 'package:airplane_app/ui/widget/container_this_year.dart';
import 'package:airplane_app/ui/widget/list_interest.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPay extends StatelessWidget {
  final Transaction transaction;
  final DestinationsModel destinationsModel;
  DetailPay({required this.transaction, required this.destinationsModel});

  @override
  Widget build(BuildContext context) {
    Widget showIconFly() {
      return Container(
        margin: EdgeInsets.only(left: 24, right: 24),
        child: Image.asset(
          'images/iconFly.png',
          width: MediaQuery.of(context).size.width - (24 * 2),
          height: 132,
        ),
      );
    }

    // NOTE: image fly
    Widget showDestinationFly() {
      return Container(
        margin: EdgeInsets.only(left: 24, right: 24),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CGK',
                style: textBlack.copyWith(fontSize: 24, fontWeight: semiBold),
              ),
              Text(
                'Tangerang',
                style: textGrey.copyWith(fontSize: 14, fontWeight: light),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'TLC',
                style: textBlack.copyWith(fontSize: 24, fontWeight: semiBold),
              ),
              Text(
                'Ciliwung',
                style: textGrey.copyWith(fontSize: 14, fontWeight: light),
              )
            ],
          )
        ]),
      );
    }

    // NOTE; coatiner top(images fly and destination)
    Widget containerTop() {
      return Column(
        children: [showIconFly(), showDestinationFly()],
      );
    }

    //NOTE: DETAIL DESTINATION CHOOSE
    Widget listDetailDestination() {
      return ContainerThisYear(destinationsModel: destinationsModel);
    }

    Widget rowCheklist({required String textInput, required Text text}) {
      return Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ListInterest(text: textInput), text],
        ),
      );
    }

    //NOTE: CONATINER LIST DETAIL CHEKLIST
    Widget detailChoose() {
      int totalPay = transaction.price * transaction.vat ~/ 100;
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: Column(
          children: [
            rowCheklist(
                textInput: 'Traveler',
                text: Text('${transaction.travaler} Person',
                    style: textBlack.copyWith(
                        fontSize: 14, fontWeight: semiBold))),
            rowCheklist(
                textInput: 'Seat',
                text: Text(transaction.seat,
                    style: textBlack.copyWith(
                        fontSize: 14, fontWeight: semiBold))),
            rowCheklist(
                textInput: 'Insurance',
                text: Text(transaction.insurance ? 'Yes' : 'No',
                    style: textGreen.copyWith(
                        fontSize: 14, fontWeight: semiBold))),
            rowCheklist(
                textInput: 'Refundable',
                text: Text(transaction.refundable ? 'Yes' : 'No',
                    style:
                        textPink.copyWith(fontSize: 14, fontWeight: semiBold))),
            rowCheklist(
                textInput: 'VAT',
                text: Text('45%',
                    style: textBlack.copyWith(
                        fontSize: 14, fontWeight: semiBold))),
            rowCheklist(
                textInput: 'Price',
                text: Text(
                    NumberFormat.currency(
                            locale: 'id', name: 'IDR ', decimalDigits: 0)
                        .format(transaction.price),
                    style: textBlack.copyWith(
                        fontSize: 14, fontWeight: semiBold))),
            rowCheklist(
                textInput: 'Grand Total',
                text: Text(
                    NumberFormat.currency(
                            locale: 'id', name: 'IDR ', decimalDigits: 0)
                        .format(totalPay + transaction.price),
                    style: textPurple.copyWith(
                        fontSize: 14, fontWeight: semiBold)))
          ],
        ),
      );
    }

    //NOTE: TITLE BOOKING
    Widget bookingTitle() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Booking Details',
          style: textBlack.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
      );
    }

    // NOTE: Container Detail Pay
    Widget containerDetailPay() {
      return Container(
        margin: EdgeInsets.only(top: 30, right: 24, left: 24),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            listDetailDestination(),
            bookingTitle(),
            SizedBox(
              height: 16,
            ),
            detailChoose()
          ],
        ),
      );
    }

    //NOTE: TITLE PAYMENT
    Widget paymentTitle() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 10),
        child: Text(
          'Payment Detail',
          style: textBlack.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
      );
    }

    //NOTE:CONTAINER LOGO
    Widget containerLogo() {
      return Container(
          width: 100,
          height: 70,
          margin: EdgeInsets.only(top: 10, left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: purpleColor,
              gradient: LinearGradient(colors: [
                lightPurpleColor.withGreen(1).withOpacity(0.7),
                purpleColor
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                width: 30,
                height: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Pay',
                style: textWhite.copyWith(fontSize: 16, fontWeight: medium),
              )
            ],
          ));
    }

    Widget rowDetailPay() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            containerLogo(),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IDR 80.400.000',
                  style: textBlack.copyWith(fontSize: 18, fontWeight: medium),
                ),
                Text(
                  'Current Balance',
                  style: textGrey.copyWith(fontSize: 14, fontWeight: light),
                )
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      );
    }

    // NOTE:PAYMENT DETAIL
    Widget containerPaymentDetail() {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 30),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [paymentTitle(), rowDetailPay()],
        ),
      );
    }

    // NOTE: button pay Now
    Widget payNowButton() {
      return ButtonPurple(
          text: 'Pay Now',
          width: MediaQuery.of(context).size.width - (2 * 48),
          function: () {
            Navigator.pushNamed(context, '/succes');
          });
    }

    Widget buttonTextTerm() {
      return TextButton(
          onPressed: () {},
          child: Text(
            'Terms and Conditions',
            style: textGrey.copyWith(fontSize: 16, fontWeight: light),
          ));
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              containerTop(),
              containerDetailPay(),
              containerPaymentDetail(),
              payNowButton(),
              SizedBox(
                height: 30,
              ),
              buttonTextTerm(),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
