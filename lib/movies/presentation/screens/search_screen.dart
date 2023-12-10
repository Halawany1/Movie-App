import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wather_app/movies/presentation/controller/movie_cubit.dart';
import 'package:wather_app/movies/presentation/widget/form_field_component.dart';
import 'package:wather_app/movies/presentation/widget/poster_component.dart';
import 'package:wather_app/movies/presentation/widget/row_details_movie_component.dart';
import 'details_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<MovieCubit, MovieState>(
      builder: (context, state) {
        var cubit = context.read<MovieCubit>();
        return Scaffold(
          backgroundColor: cubit.getSearch.isNotEmpty?const Color(0xFF0D151F):null,
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  cubit.index = 0;
                  cubit.changeIndexNavBar(0);
                },
                child:const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
            ),
            centerTitle: true,
            actions:const [
              Padding(
                padding:  EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 25,
                ),
              )
            ],
            title: Text(
              'Search',
              style: GoogleFonts.montserrat(fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  BuildFormField(
                      controller: searchController,
                      onSubmit: (value) {
                        cubit.getSearchMovies(value.toString());
                      }),
                  const  SizedBox(
                    height: 30,
                  ),
                  ConditionalBuilder(
                    builder: (context) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        itemCount: cubit.getSearch.length,
                        itemBuilder: (context, index) =>
                        cubit.getSearch[index].backdropPath !=
                            null
                            ? InkWell(
                          onTap: (){
                            // cubit.getRecommendationMovie(cubit.getSearch[index].id);
                            // cubit.getSimilarMovie(cubit.getSearch[index].id);
                            // cubit.getCastsMovies(cubit.getSearch[index].id);
                            // cubit.getReviewsMovie(cubit.getSearch[index].id);
                            cubit.getDetailsMovies(cubit.getSearch[index].id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>DetailsScreen(index: index, 
                                        movie:cubit.getDetails)
                                        
                                ));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuildPoster(
                                  height: 220,
                                  item: true,
                                  poster: cubit.getSearch[index].backdropPath!,
                                  index: index),
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      cubit.getSearch[index].originalName!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const BuildRowDetailsMovie(
                                        text:  '5.3',
                                        vote: false,
                                        icon: Icons
                                            .star_border_purple500_outlined),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    BuildRowDetailsMovie(
                                      text:  cubit.getSearch[index].id,
                                      icon: Icons.how_to_vote, vote: true,),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const  BuildRowDetailsMovie(
                                      text: '2021',
                                      icon: Icons.date_range, vote: true,),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    BuildRowDetailsMovie(
                                        text: cubit.getSearch[index].originalLanguage,
                                        icon: Icons.language, vote: true,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                            : Container(),
                      );
                    },
                    condition: cubit.getSearch.isNotEmpty,
                    fallback: (context) =>
                        ConditionalBuilder(
                          condition: searchController.text.isNotEmpty ,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 160.0),
                              child: Column(
                                children: [
                                  Image.asset('assets/images/search.png'),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  Text(
                                    'we are sorry, we can\nnot find the movie :(',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        height: 1.5,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Find your movie by Type title,\n'
                                        '\t\t\t\t\t\ttcategories, years, etc ',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF92929D),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          fallback: (context) =>
                              ConditionalBuilder(
                                fallback: (context) =>
                                const Padding(
                                      padding: EdgeInsets.all(21.0),
                                      child: LinearProgressIndicator(
                                        color: Color(0xFF3A3F47),
                                      ),
                                    ),
                                builder: (context) => Container(),
                                condition: searchController.text.isEmpty,
                              ),
                        ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}