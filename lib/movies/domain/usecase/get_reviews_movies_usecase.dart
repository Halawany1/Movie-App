import 'package:either_dart/either.dart';
import 'package:wather_app/core/error/failure.dart';
import 'package:wather_app/core/usecase/base_usecase.dart';
import 'package:wather_app/movies/domain/entities/movie.dart';

import '../respository/base_Movies_repository.dart';

class GetReviewsMovieUseCase extends BaseUseCaseWithParameter<List<Movie>,int>{
  final BaseMoviesRepository baseMoviesRepository;
  GetReviewsMovieUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(int id)async {
    return await baseMoviesRepository.getReviewsMovies(id);
  }
}