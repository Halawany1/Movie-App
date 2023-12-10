import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wather_app/core/network/api_constance.dart';
import 'package:wather_app/movies/domain/entities/movie.dart';
import 'package:wather_app/movies/presentation/controller/movie_cubit.dart';
import 'package:wather_app/movies/presentation/widget/moving_component.dart';
import 'package:wather_app/movies/presentation/widget/poster_component.dart';
import 'package:wather_app/movies/presentation/widget/row_details_movie_component.dart';

class DetailsScreen extends StatelessWidget {
  final int index;
  final List<Movie> movie;

  const DetailsScreen({super.key, required this.index, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      builder: (context, state) {
        var cubit = context.read<MovieCubit>();
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 65,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  cubit.index = 0;
                  Navigator.pop(context);
                },
                child:const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                  onTap: () {
                    cubit.postWatchListMovie(movie[index].id);
                  },
                  child:const Icon(
                    Icons.bookmark,
                    size: 30,
                  ),
                ),
              )
            ],
            title: Text(
              'Details',
              style: GoogleFonts.montserrat(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          body: ConditionalBuilder(
            builder: (context) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    buildStack(movie),
                    const  SizedBox(
                      height: 20,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.date_range,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${movie[index].releaseDate}',
                            style: GoogleFonts.lato(
                                fontSize: 14, color: Color(0xFFBCBCBC)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const VerticalDivider(color: Colors.grey, thickness: 1),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.language,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            movie[index].originalLanguage!,
                            style: GoogleFonts.lato(
                                fontSize: 14, color: Color(0xFFBCBCBC)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const  VerticalDivider(color: Colors.grey, thickness: 1),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.movie_creation_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${movie[index].genreIds![0]}',
                            style: GoogleFonts.lato(
                                fontSize: 14, color: Color(0xFFBCBCBC)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BuildMoving(
                              cubit: cubit, text: 'About Movie', index: 0),
                          const SizedBox(
                            width: 10,
                          ),
                          BuildMoving(cubit: cubit, text: 'Reviews', index: 1),
                          const SizedBox(
                            width: 10,
                          ),
                          BuildMoving(cubit: cubit, text: 'Cast', index: 2),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (cubit.index == 0)
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 370,
                              child: Text(
                                maxLines: 1000,
                                movie[index].overview!,
                                style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    color: Colors.white,
                                    height: 1.5),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Divider(
                                color: Color(0xFF3A3F47), thickness: 2),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Recommendations',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 250,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics:const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      BuildPoster(
                                        item: true,
                                        poster: cubit.getRecommendation[index]
                                            .backdropPath!,
                                        height: 220,
                                        index: null,
                                      ),
                                  separatorBuilder: (context, index) =>
                                  const SizedBox(
                                        width: 20,
                                      ),
                                  itemCount: cubit.getRecommendation.length),
                            ),
                            const Divider(color: Color(0xFF3A3F47), thickness: 2),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Similar Movie',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 250,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      BuildPoster(
                                        item: true,
                                        poster: ApiConstance.imageUrl(cubit.getSimilar[index]
                                            .backdropPath!),
                                        height: 220,
                                        index: null,
                                      ),
                                  separatorBuilder: (context, index) =>
                                  const SizedBox(
                                        width: 20,
                                      ),
                                  itemCount: cubit.getSimilar.length),
                            ),
                          ],
                        ),
                      ),
                    if (cubit.index == 2)
                      GridView.builder(
                          itemCount: cubit.getCasts.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                          cubit
                              .getCasts[index].profilePath !=
                              null
                              ? SizedBox(
                            width: 120,
                            height: 123,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 120,
                                  height: 123,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(60),
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(60),
                                    child: Image.network(
                                        fit: BoxFit.cover,
                                        ApiConstance.imageUrl( cubit
                                            .getCasts[index].profilePath!)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      maxLines: 2,
                                      cubit
                                          .getCasts[index].originalName!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                              : SizedBox(
                            width: 120,
                            height: 123,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 120,
                                  height: 123,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius:
                                    BorderRadius.circular(60),
                                  ),
                                  child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(60),
                                      child: Image.asset(
                                          'assets/images/profile.png')),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      maxLines: 2,
                                      cubit
                                          .getCasts[index].originalName!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              childAspectRatio: 1,
                              crossAxisSpacing: 1)),
                    if (cubit.index == 1)
                      cubit.getReviews.isNotEmpty
                          ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  50)),
                                          child: cubit.getReviews[index]
                                              .avatarPath != null
                                              ? ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(
                                                50),
                                            child: Image.network(
                                              ApiConstance.imageUrl(
                                                  cubit.getReviews[index]
                                                      .avatarPath!),
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                              : Image.asset(
                                            'assets/images/avatar.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '3.1',
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF0296E5)),
                                        )
                                      ],
                                    ),
                                    const  SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.getReviews[index]
                                              .author!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 313,
                                          child: Text(
                                            cubit.getReviews[index]
                                                .content!,
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(
                                height: 20,
                              ),
                          itemCount: cubit.getReviews.length)
                          : Padding(
                        padding: const EdgeInsets.all(88.0),
                        child: Text(
                          'NO Review',
                          style: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      )

                  ],
                ),
              );
            },
            condition: movie.isNotEmpty ,
            fallback: (context) =>
                Center(
                    child: LoadingAnimationWidget.twistingDots(
                        size: 40,
                        leftDotColor: const Color(0xFF0296E5),
                        rightDotColor: Colors.white)),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget buildStack(List<Movie> movie) {
    return SizedBox(
      height: 330,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child:
            Image.network(ApiConstance.imageUrl(movie[index].backdropPath!)),
          ),
          Positioned(
              left: 25,
              top: 120,
              child: BuildPoster(
                height: 200,
                item: true,
                poster: ApiConstance.imageUrl(movie[index].backdropPath!),
                index: null,
              )),
          Positioned(
            bottom: 110,
            right: 10,
            child: Container(
              width: 63,
              height: 30,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.65),
                      const Color(0xFF252836).withOpacity(0.8)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BuildRowDetailsMovie(
                      vote: false,
                      text: movie[index].voteAverage!.toStringAsFixed(1),
                      icon: Icons.star_border_purple500_outlined),
                ],
              ),
            ),
          ),
          Positioned(
            left: 180,
            top: 240,
            child: SizedBox(
              width: 210,
              child: Text(
                maxLines: 2,
                movie[index].title!,
                style: GoogleFonts.poppins(
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
