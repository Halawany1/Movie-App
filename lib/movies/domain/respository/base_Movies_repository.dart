import 'package:either_dart/either.dart';
import 'package:wather_app/movies/domain/entities/movie.dart';
import 'package:wather_app/movies/domain/entities/watch_list.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>>getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies();

  Future<Either<Failure,List<Movie>>> getUpComingMovies();

  Future<Either<Failure,List<Movie>>> getRecommendationMovies(int id);

  Future<Either<Failure,List<Movie>>> getSimilarMovies(int id);

  Future<Either<Failure,List<Movie>>> getReviewsMovies(int id);

  Future<Either<Failure,List<Movie>>>getCastMovie(int id);

  Future<Either<Failure,List<Movie>>>getDetailsMovie(int id);

  Future<Either<Failure,List<Movie>>>getSearchMovie(String text);


  Future<Either<Failure,WatchList>>postWatchListMovies(int id);
}