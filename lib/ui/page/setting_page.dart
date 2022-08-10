import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/cubit/auth_state.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/ui/widget/button_purple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/signUp', (route) => false);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: lightRedColor, content: Text('error')));
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return CircularProgressIndicator();
        }
        return Center(
          child: ButtonPurple(
            function: () {
              context.read<AuthCubit>().logout();
            },
            text: 'Sign Out',
            width: 220,
          ),
        );
      },
    );
  }
}
