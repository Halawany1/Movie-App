import 'package:either_dart/either.dart';
import 'package:wather_app/core/usecase/base_usecase.dart';
import 'package:wather_app/movies/domain/entities/watch_list.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../respository/base_Movies_repository.dart';

class PostWatchListMoviesUseCase extends BaseUseCaseWithParameter<WatchList,int>{
  final BaseMoviesRepository baseMoviesRepository;
  PostWatchListMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, WatchList>> call(int id) async{
    return await baseMoviesRepository.postWatchListMovies(id);
  }
}