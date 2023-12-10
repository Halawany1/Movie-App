import 'package:either_dart/either.dart';
import 'package:wather_app/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../respository/base_Movies_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>>{
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async{
    return await baseMoviesRepository.getPopularMovies();
  }
}