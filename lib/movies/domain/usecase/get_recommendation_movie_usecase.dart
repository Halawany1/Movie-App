import 'package:either_dart/either.dart';
import 'package:wather_app/core/error/failure.dart';
import 'package:wather_app/movies/domain/entities/movie.dart';

import '../respository/base_Movies_repository.dart';

class GetRecommendationMovieUseCase{
  final BaseMoviesRepository baseMoviesRepository;
  GetRecommendationMovieUseCase(this.baseMoviesRepository);

  Future<Either<Failure,List<Movie>>> excute(int id) async {
    return await baseMoviesRepository.getRecommendationMovies(id);
  }
}