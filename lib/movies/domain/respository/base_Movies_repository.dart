import 'package:either_dart/either.dart';
import 'package:wather_app/movies/domain/entities/movie.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>>getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
}