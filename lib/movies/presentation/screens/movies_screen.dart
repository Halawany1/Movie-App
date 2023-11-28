
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wather_app/movies/presentation/widget/movie_list_component.dart';
import 'package:wather_app/movies/presentation/widget/now_playing_component.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/utils/dummy.dart';
import '../widget/row_details_movie_component.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Container(

        alignment: Alignment.center,
        child: Icon(size: 90,Icons.access_alarm),
      )
    );
  }
}
