part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class LoadingNowPlayingMovieState extends MovieState {}

class SuccessGetNowPlayingMovieState extends MovieState {
  List<Movie> getNowPlayingMovies;

  SuccessGetNowPlayingMovieState(this.getNowPlayingMovies);
}

class FailureGetNowPlayingMovieState extends MovieState {
  String error;

  FailureGetNowPlayingMovieState(this.error);
}


