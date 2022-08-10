import 'package:airplane_app/models/destinatons_model.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:airplane_app/ui/page/choose_seat.dart';
import 'package:airplane_app/ui/widget/button_purple.dart';
import 'package:airplane_app/ui/widget/list_interest.dart';
import 'package:airplane_app/ui/widget/text_title.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationsModel destinationsModel;
  DetailPage({required this.destinationsModel});

  @override
  Widget build(BuildContext context) {
    // NOTE: bagian blus image
    Widget imageBlurBlack() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 214,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, blackColor.withOpacity(0.7)],
        )),
      );
    }

    // NOTE: bagian image
    Widget containerImage() {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 450,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(destinationsModel.imageUrl))),
          child: imageBlurBlack(),
        ),
      );
    }

    // NOTE: bagian image emblem
    Widget imageEmblem() {
      return SafeArea(
        child: Center(
          child: Image.asset(
            'images/emblem.png',
            width: 108,
            height: 24,
          ),
        ),
      );
    }

    //NOTE: Column Price
    Widget buttonColumnPrice() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            NumberFormat.currency(locale: 'id', name: 'IDR ', decimalDigits: 0)
                .format(destinationsModel.price),
            style: textBlack.copyWith(fontSize: 18, fontWeight: medium),
          ),
          SizedBox(height: 6),
          Text(
            'per orang',
            style: textGrey.copyWith(fontSize: 14, fontWeight: light),
          ),
        ],
      );
    }

    //NOTE: Container Detail bottom (price and button)
    Widget containerBottomDetail() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: buttonColumnPrice()),
            Expanded(
              child: ButtonPurple(
                text: 'Book Now',
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChoosePage(
                              destinationsModel: destinationsModel)));
                },
                width: 170,
                height: 55,
              ),
            )
          ],
        ),
      );
    }

    //NOTE: list interest
    Widget listInterest() {
      return Wrap(children: [
        ListInterest(text: 'Kids Park'),
        ListInterest(text: 'Honor Bridge'),
        ListInterest(text: 'City Museum'),
        ListInterest(text: 'Central Mall'),
      ]);
    }

    // NOTE: bagian Column judul dan location
    Widget columTitle() {
      return Container(
        margin: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              destinationsModel.name,
              style: textWhite.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            Text(
              destinationsModel.city,
              style: textWhite.copyWith(fontSize: 16, fontWeight: light),
            )
          ],
        ),
      );
    }

    // NOTE: bagian list Photos
    Widget listPhotos() {
      return Container(
        height: 70,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/photo1.png'))),
            ),
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/photo2.png'))),
            ),
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/photo3.png'))),
            )
          ],
        ),
      );
    }

    // NOTE: bagian Row Rating
    Widget rowRating() {
      return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Image.asset(
              'images/rating.png',
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              destinationsModel.rating.toString(),
              style: textWhite.copyWith(fontSize: 16, fontWeight: medium),
            )
          ],
        ),
      );
    }

    // NOTE: bagian Text About Dan keterangannya
    Widget containerTextAbout() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: textBlack.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 6),
          Text(
            'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
            style: textBlack.copyWith(fontSize: 14, fontWeight: regular),
          )
        ],
      );
    }

    // NOTE: bagian container untuk menampung About, image list dan interest
    Widget containerAbout() {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 20, right: 20, top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            containerTextAbout(),
            TextTitle(
              text: 'Photos',
              marginInput: EdgeInsets.only(top: 20, bottom: 6),
            ),
            listPhotos(),
            TextTitle(
              text: 'Interest',
              marginInput: EdgeInsets.only(top: 20, bottom: 6),
            ),
            listInterest()
          ],
        ),
      );
    }

    // NOTE: bagian container untuk menggabungkan Title dan rating
    Widget containerTitle() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [columTitle(), rowRating()],
      );
    }

    // NOTE: bagian Semua detail yanag akan di tampilkan pada user / screen
    Widget viewDetail() {
      return Column(
        children: [
          SizedBox(
            height: 20,
          ),
          imageEmblem(),
          SizedBox(
            height: 256,
          ),
          containerTitle(),
          containerAbout(),
          containerBottomDetail()
        ],
      );
    }

    // NOTE: bagian Utama
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            containerImage(),
            viewDetail(),
          ],
        ),
      ),
    );
  }
}
