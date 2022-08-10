import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/cubit/auth_state.dart';
import 'package:airplane_app/cubit/page_cubit.dart';
import 'package:airplane_app/shared/colors.dart';
import 'package:airplane_app/shared/fonts.dart';
import 'package:airplane_app/shared/weight.dart';
import 'package:airplane_app/ui/widget/button_purple.dart';
import 'package:airplane_app/ui/widget/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  // NOTE:handle text field
  final TextEditingController edtEmail = TextEditingController(text: '');
  final TextEditingController edtPassword = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget textTitle() {
      return Text(
        'Join us and get\nyour next journey',
        style: textBlack.copyWith(fontSize: 24, fontWeight: semiBold),
      );
    }

    Widget buttonToSignUp() {
      return TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signUp');
          },
          child: Text(
            'don\'t have account?, SignUp',
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
            SizedBox(
              height: 35,
            ),
            BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
              if (state is AuthLoading) {
                return CircularProgressIndicator();
              }
              return ButtonPurple(
                  text: 'SignIn',
                  function: () {
                    context.read<PageCubit>().replacePage = 0;
                    context.read<AuthCubit>().signIn(
                        email: edtEmail.text, password: edtPassword.text);
                  });
            }, listener: (context, state) {
              if (state is AuthSucces) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/mainMenu', (route) => false);
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: lightRedColor,
                    content: Text(state.error)));
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
              Center(child: buttonToSignUp()),
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
