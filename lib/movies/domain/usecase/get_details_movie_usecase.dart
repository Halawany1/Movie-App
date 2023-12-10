import 'package:either_dart/either.dart';
import 'package:wather_app/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../respository/base_Movies_repository.dart';

class GetDetailsMoviesUseCase extends BaseUseCaseWithParameter<List<Movie>,int>{
  final BaseMoviesRepository baseMoviesRepository;
  GetDetailsMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(int id) async{
    return await baseMoviesRepository.getDetailsMovie(id);
  }
}