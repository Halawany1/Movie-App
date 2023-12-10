import 'dart:math';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wather_app/core/network/remote_network.dart';
import 'package:wather_app/movies/domain/entities/movie.dart';
import 'package:wather_app/movies/presentation/controller/movie_cubit.dart';
import 'package:wather_app/movies/presentation/screens/layout/layout_screen.dart';
import 'package:wather_app/movies/presentation/screens/onboarding_screen.dart';

import 'core/constant.dart';
import 'core/observer/observer.dart';
import 'core/services/services_locator.dart';
import 'movies/presentation/screens/home_screen.dart';

void main() async {
  ServiceLocator().init();
  MovieDioHelper.initMovie();
  WatchListDioHelper.initWatchList();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      )
        ..getTopRatedMovies()
        ..getNowPlayingMovie()
        ..getPopularMovies()
        ..getUpComingMovie(),
      child: MaterialApp(
        home: AnimatedSplashScreen(
          nextScreen: const OnBoardingScreen(),
          animationDuration: Duration(seconds: 1),
          duration: 3,
          backgroundColor: color,
          splashTransition: SplashTransition.scaleTransition,
          splashIconSize: 150,
          splash: 'assets/images/splash.png',
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: color,
            appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: color,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: color,
                    statusBarIconBrightness: Brightness.light),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ))),
      ),
    );
  }
}
