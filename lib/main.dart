import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wather_app/clean%20architecture/data/datasource/remote_datasource.dart';
import 'package:wather_app/movies/domain/entities/movie.dart';

import 'core/observer/observer.dart';
import 'movies/presentation/screens/movies_screen.dart';


void main() async{
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Movie App sdfs',
      home:  MainMoviesScreen()
    );
  }
}

