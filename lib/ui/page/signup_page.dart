import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/cubit/auth_state.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:airplane_app/ui/widget/button_purple.dart';
import 'package:airplane_app/ui/widget/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  TextEditingController edtName = TextEditingController(text: '');
  TextEditingController edtEmail = TextEditingController(text: '');
  TextEditingController edtPassword = TextEditingController(text: '');
  TextEditingController edtHobby = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget textTitle() {
      return Text(
        'Join us and get\nyour next journey',
        style: textBlack.copyWith(fontSize: 24, fontWeight: semiBold),
      );
    }

    Widget buttonTerms() {
      return TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signIn');
          },
          child: Text(
            'have a account?, Login',
            style: textGrey.copyWith(fontSize: 16, fontWeight: light),
          ));
    }

    Widget containerTextField() {
      return Container(
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        padding: EdgeInsets.only(top: 35, left: 20, right: 20),
        child: Column(
          children: [
            TextFields(
              text: 'Full Name',
              hint: ' Entered your name',
              controller: edtName,
            ),
            TextFields(
              text: 'Email',
              hint: ' Entered your Email',
              controller: edtEmail,
            ),
            TextFields(
              text: 'Password',
              hint: ' Entered your Password',
              dontRead: true,
              controller: edtPassword,
            ),
            TextFields(
              text: 'Hobby',
              hint: ' Entered your Hobby',
              controller: edtHobby,
            ),
            SizedBox(
              height: 35,
            ),
            BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
              if (state is AuthLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ButtonPurple(
                  text: 'Sign Up',
                  function: () {
                    context.read<AuthCubit>().signUp(
                        name: edtName.text,
                        email: edtEmail.text,
                        password: edtPassword.text,
                        hobby: edtHobby.text);
                  });
            }, listener: (context, state) {
              if (state is AuthSucces) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/saldo', (route) => false);
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red, content: Text(state.error)));
              }
            })
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textTitle(),
              containerTextField(),
              SizedBox(
                height: 55,
              ),
              Center(child: buttonTerms()),
              SizedBox(
                height: 73,
              )
            ],
          ),
        ),
      ),
    );
  }
}
