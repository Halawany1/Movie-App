import 'package:get_it/get_it.dart';
import 'package:wather_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:wather_app/movies/data/respository/movie_repository.dart';
import 'package:wather_app/movies/domain/respository/base_Movies_repository.dart';
import 'package:wather_app/movies/domain/usecase/get_casts_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_details_movie_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_recommendation_movie_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_reviews_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_search_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_up_coming_movie_usecase.dart';
import 'package:wather_app/movies/domain/usecase/get_similar_movies_usecase.dart';
import 'package:wather_app/movies/domain/usecase/post_watch_list_movies_usecase.dart';
import 'package:wather_app/movies/presentation/controller/movie_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {

    ///cubit
    sl.registerFactory(() => MovieCubit( sl(),sl(),
        sl(), sl(), sl(),sl(),sl(),sl(),sl(),sl(),sl()));

    /// usecase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetUpComingMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetCastMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetSimilarMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetReviewsMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetSearchMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetDetailsMoviesUseCase(sl()));
    sl.registerLazySingleton(() => PostWatchListMoviesUseCase(sl()));
    /// repository
    sl.registerLazySingleton<BaseMoviesRepository>(() =>
        MoviesRepository(sl()));

    /// data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() =>
        MovieRemoteDataSource());
  }
}