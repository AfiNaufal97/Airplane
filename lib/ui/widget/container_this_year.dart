import 'package:airplane_app/models/destinatons_model.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:flutter/material.dart';

class ContainerThisYear extends StatelessWidget {
  final DestinationsModel destinationsModel;
  ContainerThisYear({required this.destinationsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - (2 * 20),
      height: 90,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(borderRadius)),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(destinationsModel.imageUrl))),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destinationsModel.name,
                  style: textBlack.copyWith(fontSize: 18, fontWeight: medium),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  destinationsModel.city,
                  style: textGrey.copyWith(fontSize: 14, fontWeight: light),
                )
              ],
            ),
          ),
          Spacer(),
          Row(
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
                style: textBlack.copyWith(fontSize: 14, fontWeight: medium),
              )
            ],
          ),
        ],
      ),
    );
  }
}
