import 'package:airplane_app/models/destinatons_model.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:airplane_app/ui/page/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerDestination extends StatelessWidget {
  final DestinationsModel model;

  ContainerDestination(this.model);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(destinationsModel: model)));
        },
        child: Container(
          width: 200,
          height: 323,
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(borderRadius)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 180,
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    image:
                        DecorationImage(image: NetworkImage(model.imageUrl))),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style:
                          textBlack.copyWith(fontSize: 18, fontWeight: medium),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      model.city,
                      style: textGrey.copyWith(fontSize: 14, fontWeight: light),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
