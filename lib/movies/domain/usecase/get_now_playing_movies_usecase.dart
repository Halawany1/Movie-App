import 'package:either_dart/either.dart';
import 'package:wather_app/core/usecase/base_usecase.dart';
import 'package:wather_app/movies/domain/entities/movie.dart';
import 'package:wather_app/movies/domain/respository/base_Movies_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>>{
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}