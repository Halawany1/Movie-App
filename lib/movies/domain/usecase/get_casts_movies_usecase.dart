import 'package:either_dart/either.dart';
import 'package:wather_app/core/usecase/base_usecase.dart';
import 'package:wather_app/movies/domain/entities/movie.dart';
import 'package:wather_app/movies/domain/respository/base_Movies_repository.dart';

import '../../../core/error/failure.dart';

class GetCastMoviesUseCase extends BaseUseCaseWithParameter<List<Movie>,int>{
  final BaseMoviesRepository baseMoviesRepository;
  GetCastMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(int id) async{
    return await baseMoviesRepository.getCastMovie(id);
  }
}