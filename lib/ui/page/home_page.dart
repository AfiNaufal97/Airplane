import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/cubit/auth_state.dart';
import 'package:airplane_app/cubit/destinations_cubit.dart';
import 'package:airplane_app/models/destinatons_model.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:airplane_app/ui/widget/container_destination.dart';
import 'package:airplane_app/ui/widget/container_this_year.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DestinationsCubit>().getFetchData();
  }

  @override
  Widget build(BuildContext context) {
    Widget textTitle() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
            if (state is AuthSucces) {
              return Text(
                'Howdy,\n${state.userModel.name}',
                style: textBlack.copyWith(fontSize: 24, fontWeight: semiBold),
              );
            } else {
              return Text('');
            }
          }),
          SizedBox(
            height: 6,
          ),
          Text(
            'Where to fly today?',
            style: textGrey.copyWith(fontSize: 18, fontWeight: light),
          )
        ],
      );
    }

    Widget circleImage() {
      return CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('images/profile.png'),
      );
    }

    Widget containerTop() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [textTitle(), circleImage()],
      );
    }

    Widget titleThisYear() {
      return Container(
        margin: EdgeInsets.only(top: 30, bottom: 16),
        child: Text(
          'New This Year',
          style: textBlack.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
      );
    }

    Widget listThisYear(List<DestinationsModel> destination) {
      return Column(
          children: destination
              .map((e) => ContainerThisYear(destinationsModel: e))
              .toList());
    }

    Widget listDestination(List<DestinationsModel> destinations) {
      return Container(
        height: 323,
        margin: EdgeInsets.only(top: 30),
        child: ListView(
            scrollDirection: Axis.horizontal,
            children:
                destinations.map((e) => ContainerDestination(e)).toList()),
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: BlocConsumer<DestinationsCubit, DestinationsState>(
          listener: (context, state) {
            if (state is DestinationsError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            if (state is DestinationsSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  containerTop(),
                  listDestination(state.model),
                  titleThisYear(),
                  listThisYear(state.model)
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
