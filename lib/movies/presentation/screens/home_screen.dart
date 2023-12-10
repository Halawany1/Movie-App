import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wather_app/movies/presentation/controller/movie_cubit.dart';
import 'package:wather_app/movies/presentation/screens/details_screen.dart';
import 'package:wather_app/movies/presentation/widget/form_field_component.dart';
import 'package:wather_app/movies/presentation/widget/moving_component.dart';
import 'package:wather_app/movies/presentation/widget/poster_component.dart';

import '../../../core/constant.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<MovieCubit, MovieState>(
      builder: (context, state) {
        var cubit = context.read<MovieCubit>();
        return Scaffold(
          appBar: AppBar(
            iconTheme:const IconThemeData(
                size: 0,
                color: color
            ),
            titleSpacing: 20,
            title: Text(
              "What do you want to watch?",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          body: ConditionalBuilder(
            condition: cubit.getNowPlaying.isNotEmpty,
            builder: (context) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      BuildFormField(
                        controller: searchController,
                        onSubmit: (p0) {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 240,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics:const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                InkWell(
                                  onTap: () {
                                    cubit.index == 0
                                        ? cubit.getCastsMovies(cubit.getNowPlaying[index].id!)
                                        : cubit.index == 1
                                        ? cubit.getCastsMovies(cubit.getUpComing[index].id!)
                                        : cubit.index == 2
                                        ? cubit.getCastsMovies(cubit.getTopRated[index].id!)
                                        : cubit.getCastsMovies(cubit.getPopular[index].id!);

                                    cubit.index == 0
                                        ? cubit.getRecommendationMovie(cubit.getNowPlaying[index].id!)
                                        : cubit.index == 1
                                        ? cubit.getRecommendationMovie(cubit.getUpComing[index].id!)
                                        : cubit.index == 2
                                        ? cubit.getRecommendationMovie(cubit.getTopRated[index].id!)
                                        : cubit.getRecommendationMovie(cubit.getPopular[index].id!);

                                    cubit.index == 0
                                        ? cubit.getSimilarMovie(cubit.getNowPlaying[index].id!)
                                        : cubit.index == 1
                                        ? cubit.getSimilarMovie(cubit.getUpComing[index].id!)
                                        : cubit.index == 2
                                        ? cubit.getSimilarMovie(cubit.getTopRated[index].id!)
                                        : cubit.getSimilarMovie(cubit.getPopular[index].id!);


                                    cubit.index == 0
                                        ? cubit.getReviewsMovie(cubit.getNowPlaying[index].id!)
                                        : cubit.index == 1
                                        ? cubit.getReviewsMovie(cubit.getUpComing[index].id!)
                                        : cubit.index == 2
                                        ? cubit.getReviewsMovie(cubit.getTopRated[index].id!)
                                        : cubit.getReviewsMovie(cubit.getPopular[index].id!);


                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return DetailsScreen(index: index, movie:
                                          cubit.index == 0
                                              ? cubit.getNowPlaying
                                              : cubit.index == 1
                                              ? cubit.getUpComing
                                              : cubit.index == 2
                                              ? cubit.getTopRated
                                              : cubit.getPopular,);
                                        },));
                                  },
                                  child: BuildPoster(
                                      poster: cubit.getNowPlaying[index].backdropPath!,
                                      index: index, height: 220,
                                    item: false,),
                                ),
                            separatorBuilder: (context, index) =>
                            const SizedBox(
                                  width: 20,
                                ),
                            itemCount: 5),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            BuildMoving(
                                cubit: cubit, text: 'Now Playing', index: 0),
                            const SizedBox(width: 8),
                            BuildMoving(
                                cubit: cubit, text: 'Upcoming', index: 1),
                            const  SizedBox(width: 8),
                            BuildMoving(
                                cubit: cubit, text: 'Top Rated', index: 2),
                            const  SizedBox(width: 8),
                            BuildMoving(
                                cubit: cubit, text: 'Popular', index: 3),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                     GridView.builder(
                        physics:const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: cubit.index == 0
                            ? cubit.getNowPlaying.length
                            : cubit.index == 1
                            ? cubit.getUpComing.length
                            : cubit.index == 2
                            ? cubit.getTopRated.length
                            : cubit.getPopular.length,
                        gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.63,
                            crossAxisSpacing: 15),
                        itemBuilder: (context, index) =>
                            InkWell(
                              onTap: () {
                                cubit.index == 0
                                    ? cubit.getCastsMovies(cubit.getNowPlaying[index].id!)
                                    : cubit.index == 1
                                    ? cubit.getCastsMovies(cubit.getUpComing[index].id!)
                                    : cubit.index == 2
                                    ? cubit.getCastsMovies(cubit.getTopRated[index].id!)
                                    : cubit.getCastsMovies(cubit.getPopular[index].id!);

                                cubit.index == 0
                                    ? cubit.getRecommendationMovie(cubit.getNowPlaying[index].id!)
                                    : cubit.index == 1
                                    ? cubit.getRecommendationMovie(cubit.getUpComing[index].id!)
                                    : cubit.index == 2
                                    ? cubit.getRecommendationMovie(cubit.getTopRated[index].id!)
                                    : cubit.getRecommendationMovie(cubit.getPopular[index].id!);

                                cubit.index == 0
                                    ? cubit.getSimilarMovie(cubit.getNowPlaying[index].id!)
                                    : cubit.index == 1
                                    ? cubit.getSimilarMovie(cubit.getUpComing[index].id!)
                                    : cubit.index == 2
                                    ? cubit.getSimilarMovie(cubit.getTopRated[index].id!)
                                    : cubit.getSimilarMovie(cubit.getPopular[index].id!);


                                cubit.index == 0
                                    ? cubit.getReviewsMovie(cubit.getNowPlaying[index].id!)
                                    : cubit.index == 1
                                    ? cubit.getReviewsMovie(cubit.getUpComing[index].id!)
                                    : cubit.index == 2
                                    ? cubit.getReviewsMovie(cubit.getTopRated[index].id!)
                                    : cubit.getReviewsMovie(cubit.getPopular[index].id!);


                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return DetailsScreen(index: index, movie:
                                      cubit.index == 0
                                          ? cubit.getNowPlaying
                                          : cubit.index == 1
                                          ? cubit.getUpComing
                                          : cubit.index == 2
                                          ? cubit.getTopRated
                                          : cubit.getPopular,);
                                    },));
                              },
                              child: BuildPoster(
                                poster: cubit.index == 0
                                    ? cubit.getNowPlaying[index].backdropPath!
                                    : cubit.index == 1
                                    ? cubit.getUpComing[index].backdropPath!
                                    : cubit.index == 2
                                    ? cubit.getTopRated[index].backdropPath!
                                    : cubit.getPopular[index].backdropPath!,
                                item: true,
                                index: index, height: 220,),
                            ),
                      )
                    ],
                  ),
                ),
              );
            },
            fallback: (context) =>
                const Center(
                    child: CircularProgressIndicator()),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}