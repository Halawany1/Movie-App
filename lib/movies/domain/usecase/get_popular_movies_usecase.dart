import 'package:either_dart/either.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../respository/base_Movies_repository.dart';

class GetPopularMoviesUseCase{
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure,List<Movie>>> excute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}