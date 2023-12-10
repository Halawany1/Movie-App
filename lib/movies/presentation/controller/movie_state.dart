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

class LoadingPopularMovieState extends MovieState {}

class SuccessGetPopularMovieState extends MovieState {
  List<Movie> getPopularMovies;

  SuccessGetPopularMovieState(this.getPopularMovies);
}

class FailureGetPopularMovieState extends MovieState {
  String error;

  FailureGetPopularMovieState(this.error);
}
class LoadingTopRatedMovieState extends MovieState {}

class SuccessGetTopRatedMovieState extends MovieState {
  List<Movie> getTopRatedMovies;

  SuccessGetTopRatedMovieState(this.getTopRatedMovies);
}

class FailureGetTopRatedMovieState extends MovieState {
  String error;

  FailureGetTopRatedMovieState(this.error);
}

class LoadingUpComingMovieState extends MovieState {}

class SuccessGetUpComingMovieState extends MovieState {
  List<Movie> getUpComingMovies;

  SuccessGetUpComingMovieState(this.getUpComingMovies);
}

class FailureGetUpComingMovieState extends MovieState {
  String error;

  FailureGetUpComingMovieState(this.error);
}

class LoadingReviewsMovieState extends MovieState {}

class SuccessGetReviewsMovieState extends MovieState {
  List<Movie> getReviewsMovies;

  SuccessGetReviewsMovieState(this.getReviewsMovies);
}

class FailureGetReviewsMovieState extends MovieState {
  String error;

  FailureGetReviewsMovieState(this.error);
}

class LoadingSimilarMovieState extends MovieState {}

class SuccessGetSimilarMovieState extends MovieState {
  List<Movie> getSimilarMovies;

  SuccessGetSimilarMovieState(this.getSimilarMovies);
}

class FailureGetSimilarMovieState extends MovieState {
  String error;

  FailureGetSimilarMovieState(this.error);
}

class LoadingWatchListMovieState extends MovieState {}

class SuccessPostWatchListMovieState extends MovieState {
  WatchList getWatchListMovies;

  SuccessPostWatchListMovieState(this.getWatchListMovies);
}

class FailurePostWatchListMovieState extends MovieState {
  String error;

  FailurePostWatchListMovieState(this.error);
}


class LoadingSearchMovieState extends MovieState {}

class SuccessGetSearchMovieState extends MovieState {
  List<Movie> getSearchMovies;

  SuccessGetSearchMovieState(this.getSearchMovies);
}

class FailureGetSearchMovieState extends MovieState {
  String error;

  FailureGetSearchMovieState(this.error);
}

class LoadingDetailsMovieState extends MovieState {}

class SuccessGetDetailsMovieState extends MovieState {
  List<Movie> getDetailsMovies;

  SuccessGetDetailsMovieState(this.getDetailsMovies);
}

class FailureGetDetailsMovieState extends MovieState {
  String error;

  FailureGetDetailsMovieState(this.error);
}

class LoadingCastsMovieState extends MovieState {}

class SuccessChangeIndexNavBarState extends MovieState {}

class SuccessGetCastsMovieState extends MovieState {
  List<Movie> getCastsMovies;

  SuccessGetCastsMovieState(this.getCastsMovies);
}

class FailureGetCastsMovieState extends MovieState {
  String error;

  FailureGetCastsMovieState(this.error);
}

class LoadingRecommendationMovieState extends MovieState {}

class SuccessGetRecommendationMovieState extends MovieState {
  List<Movie> getRecommendationMovies;

  SuccessGetRecommendationMovieState(this.getRecommendationMovies);
}

class FailureGetRecommendationMovieState extends MovieState {
  String error;

  FailureGetRecommendationMovieState(this.error);
}



class SuccessChangeIndexMovieState extends MovieState {}

class SuccessChangeVisabilityMovieState extends MovieState {}