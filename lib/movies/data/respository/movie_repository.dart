
import 'package:either_dart/either.dart';
import 'package:wather_app/core/error/exception.dart';
import 'package:wather_app/core/error/failure.dart';
import 'package:wather_app/movies/domain/entities/movie.dart';
import 'package:wather_app/movies/domain/respository/base_Movies_repository.dart';

import '../datasource/movie_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository{

  BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async {
    final result= await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerFailure(message: error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> getPopularMovies() async {
    final result= await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerFailure(message: error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> getTopRatedMovies() async{
    final result= await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch(error){
      return Left(ServerFailure(message: error.errorMessageModel.statusMessage));
    }
  }

}