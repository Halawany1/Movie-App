import 'package:either_dart/either.dart';
import 'package:wather_app/core/error/failure.dart';
import 'package:wather_app/core/usecase/base_usecase.dart';
import 'package:wather_app/movies/domain/entities/movie.dart';

import '../respository/base_Movies_repository.dart';

class GetUpComingMovieUseCase extends BaseUseCase<List<Movie>>{
  final BaseMoviesRepository baseMoviesRepository;
  GetUpComingMovieUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async{
    return await baseMoviesRepository.getUpComingMovies();
  }
}