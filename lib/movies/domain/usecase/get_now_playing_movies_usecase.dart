import 'package:either_dart/either.dart';
import 'package:wather_app/movies/domain/entities/movie.dart';
import 'package:wather_app/movies/domain/respository/base_Movies_repository.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase{
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure,List<Movie>>> excute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}