import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/cubit/destinations_cubit.dart';
import 'package:airplane_app/cubit/page_cubit.dart';
import 'package:airplane_app/cubit/seat_cubit.dart';
import 'package:airplane_app/ui/page/get_started_page.dart';
import 'package:airplane_app/ui/page/main_menu_page.dart';
import 'package:airplane_app/ui/page/signin_page.dart';
import 'package:airplane_app/ui/page/signup_page.dart';
import 'package:airplane_app/ui/page/splash_page.dart';
import 'package:airplane_app/ui/page/succes_checkout_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/page/saldo_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageCubit>(create: (context) => PageCubit()),
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<DestinationsCubit>(
          create: (context) => DestinationsCubit(),
        ),
        BlocProvider<SeatCubit>(create: (context) => SeatCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(),
          '/getStarted': (context) => GetStarted(),
          '/signUp': (context) => SignUp(),
          '/signIn': (context) => SignIn(),
          '/saldo': (context) => Saldo(),
          '/mainMenu': (context) => MainMenu(),
          '/succes': (context) => SuccesCheckout()
        },
      ),
    );
  }
}
