import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wather_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:wather_app/movies/data/models/movie_model.dart';
import 'package:wather_app/movies/data/respository/movie_repository.dart';
import 'package:wather_app/movies/domain/entities/watch_list.dart';
import 'package:wather_app/movies/domain/respository/base_Movies_repository.dart';
import 'package:wather_app/movies/domain/usecase/get_casts_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_details_movie_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_recommendation_movie_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_search_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_up_coming_movie_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_similar_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/post_watch_list_movies_usecase.dart';
import 'package:wather_app/movies/presentation/screens/home_screen.dart';
import 'package:wather_app/movies/presentation/screens/search_screen.dart';
import 'package:wather_app/movies/presentation/screens/warch_list_screen.dart';

import '../../domain/entities/movie.dart';
import '../../domain/usecase/get_reviews_movies_usecase.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetCastMoviesUseCase getCastMoviesUseCase;
  final GetSimilarMovieUseCase getSimilarMovieUseCase;
  final GetDetailsMoviesUseCase getDetailsMoviesUseCase ;
  final GetSearchMovieUseCase getSearchMovieUseCase;
  final GetReviewsMovieUseCase getReviewsMovieUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetUpComingMovieUseCase getUpComingMoviesUseCase;
  final GetRecommendationMovieUseCase getRecommendationMovieUseCase;
  final PostWatchListMoviesUseCase postWatchListMoviesUseCase;

  MovieCubit(
      this.getUpComingMoviesUseCase,
      this.getDetailsMoviesUseCase,
      this.postWatchListMoviesUseCase,
      this.getSimilarMovieUseCase,
      this.getSearchMovieUseCase,
      this.getReviewsMovieUseCase,
      this.getCastMoviesUseCase,
      this.getNowPlayingMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getRecommendationMovieUseCase,
      this.getTopRatedMoviesUseCase)
      : super(MovieInitial());

  List<Movie> getRecommendation = [];

  void getRecommendationMovie(int id) async {
    emit(LoadingRecommendationMovieState());
    final result = await getRecommendationMovieUseCase.excute(id);
    result.fold((left) {
      emit(FailureGetRecommendationMovieState(left.message));
    }, (right) {
      getRecommendation = right;
      emit(SuccessGetRecommendationMovieState(right));
    });
  }

  List<Movie> getSimilar = [];

  void getSimilarMovie(int id) async {
    emit(LoadingSimilarMovieState());
    final result = await getSimilarMovieUseCase(id);
    result.fold((left) {
      emit(FailureGetSimilarMovieState(left.message));
    }, (right) {
      getSimilar = right;
      emit(SuccessGetSimilarMovieState(right));
    });
  }



  void postWatchListMovie(int id) async {
    emit(LoadingWatchListMovieState());
    final result = await postWatchListMoviesUseCase(id);
    result.fold((left) {
      emit(FailurePostWatchListMovieState(left.message));
    }, (right) {
      emit(SuccessPostWatchListMovieState(right));
    });
  }

  List<Movie> getReviews = [];

  void getReviewsMovie(int id) async {
    emit(LoadingReviewsMovieState());
    final result = await getReviewsMovieUseCase(id);
    result.fold((left) {
      emit(FailureGetReviewsMovieState(left.message));
    }, (right) {
      getReviews = right;
      emit(SuccessGetReviewsMovieState(right));
    });
  }

  List<Movie> getNowPlaying = [];

  void getNowPlayingMovie() async {
    emit(LoadingNowPlayingMovieState());
    final result = await getNowPlayingMoviesUseCase();
    result.fold((left) {
      emit(FailureGetNowPlayingMovieState(left.message));
    }, (right) {
      getNowPlaying = right;
      emit(SuccessGetNowPlayingMovieState(right));
    });
  }

  List<Movie> getUpComing = [];

  void getUpComingMovie() async {
    emit(LoadingUpComingMovieState());
    final result = await getUpComingMoviesUseCase();
    result.fold((left) {
      emit(FailureGetUpComingMovieState(left.message));
    }, (right) {
      getUpComing = right;
      emit(SuccessGetUpComingMovieState(right));
    });
  }

  List<Movie> getPopular = [];

  void getPopularMovies() async {
    emit(LoadingPopularMovieState());
    final result = await getPopularMoviesUseCase();
    result.fold((left) {
      emit(FailureGetPopularMovieState(left.message));
    }, (right) {
      getPopular = right;
      emit(SuccessGetPopularMovieState(right));
    });
  }

  List<Movie> getTopRated = [];

  void getTopRatedMovies() async {
    emit(LoadingTopRatedMovieState());

    final result = await getTopRatedMoviesUseCase();
    result.fold((left) {
      emit(FailureGetTopRatedMovieState(left.message));
    }, (right) {
      getTopRated = right;
      emit(SuccessGetTopRatedMovieState(right));
    });
  }

  List<Movie> getCasts = [];

  void getCastsMovies(int id) async {
    emit(LoadingCastsMovieState());

    final result = await getCastMoviesUseCase(id);
    result.fold((left) {
      emit(FailureGetCastsMovieState(left.message));
    }, (right) {
      getCasts = right;

      emit(SuccessGetCastsMovieState(right));
    });
  }

  List<Movie> getSearch = [];

  void getSearchMovies(String text) async {
    emit(LoadingSearchMovieState());
    final result = await getSearchMovieUseCase(text);
    result.fold((left) {
      emit(FailureGetSearchMovieState(left.message));
    }, (right) {
      getSearch = right;
      print(right);
      emit(SuccessGetSearchMovieState(right));
    });
  }

  List<Movie> getDetails = [];

  void getDetailsMovies(int id) async {
    emit(LoadingDetailsMovieState());
    final result = await getDetailsMoviesUseCase(id);
    result.fold((left) {
      emit(FailureGetDetailsMovieState(left.message));
    }, (right) {
      getDetails = right;
      print(right);
      emit(SuccessGetDetailsMovieState(right));
    });
  }

  int index = 0;

  void changeIndex(int i) {
    index = i;
    emit(SuccessChangeIndexMovieState());
  }

  bool visability = false;

  void changeVisabilityIcon() {
    visability = !visability;
    emit(SuccessChangeVisabilityMovieState());
  }

  int indexNavbar = 0;

  void changeIndexNavBar(int i) {
    indexNavbar = i;
    emit(SuccessChangeIndexNavBarState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const WatchListScreen()
  ];
}
