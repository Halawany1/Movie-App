
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wather_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:wather_app/movies/data/models/movie_model.dart';
import 'package:wather_app/movies/data/respository/movie_repository.dart';
import 'package:wather_app/movies/domain/respository/base_Movies_repository.dart';
import 'package:wather_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';

import '../../domain/entities/movie.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());



  void getNowPlayingMovie(){
    emit(LoadingNowPlayingMovieState());
    BaseMovieRemoteDataSource baseMovieRemoteDataSource=MovieRemoteDataSource();
    BaseMoviesRepository baseMoviesRepository=
    MoviesRepository(baseMovieRemoteDataSource);
    final result=GetNowPlayingMoviesUseCase(baseMoviesRepository).
    excute();
    result.fold((left) {
      emit(FailureGetNowPlayingMovieState(left.message));
    }, (right) {
      print(right);
      emit(SuccessGetNowPlayingMovieState(right));
    });

  }

}
