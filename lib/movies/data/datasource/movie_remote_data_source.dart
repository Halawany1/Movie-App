import 'package:dio/dio.dart';
import 'package:wather_app/core/error/exception.dart';
import 'package:wather_app/core/network/api_constance.dart';
import 'package:wather_app/core/network/error_message_model.dart';
import 'package:wather_app/core/network/remote_network.dart';
import 'package:wather_app/movies/data/models/movie_model.dart';
import 'package:wather_app/movies/data/models/watch_list_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<List<MovieModel>> getUpComingMovies();

  Future<List<MovieModel>> getRecommendationMovies(int id);

  Future<List<MovieModel>> getSimilarMovies(int id);

  Future<List<MovieModel>> getCastMovies(int id);

  Future<List<MovieModel>> getReviewsMovies(int id);

  Future<List<MovieModel>> getSearchMovies(String text);

  Future<List<MovieModel>> getDetailsMovies(int id);

  Future<WatchListModel> postWatchListMovies(int id);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response =
        await MovieDioHelper.getData(url: ApiConstance.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          (response.data["results"]).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await MovieDioHelper.getData(url: ApiConstance.popularMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data['results'].map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response =
        await MovieDioHelper.getData(url: ApiConstance.topRatedMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data['results'].map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getRecommendationMovies(int id) async {
    final response = await MovieDioHelper.getData(
        url: ApiConstance.recommendationMoviePath(id));
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data['results'].map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getUpComingMovies() async {
    final response =
        await MovieDioHelper.getData(url: ApiConstance.upComingMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data['results'].map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getCastMovies(int id) async {
    final response =
        await MovieDioHelper.getData(url: ApiConstance.castMoviePath(id));
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data['cast'].map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getSimilarMovies(int id) async {
    final response =  await MovieDioHelper.getData(url: ApiConstance.similarMoviePath(id));
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data['results'].map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getReviewsMovies(int id) async {
    final response =
        await MovieDioHelper.getData(url: ApiConstance.reviewsMoviePath(id),query: {
          'language':'en-US',
          'page':1
        });
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data['results'].map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getSearchMovies(String text) async {
    final response =
        await MovieDioHelper.getData(url: ApiConstance.searchMoviePath,
            query: {
        'query':text,
        'language':'en-US',
        'page':1
        });
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data['results'].map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getDetailsMovies(int id) async {
    final response =
        await MovieDioHelper.getData(url: ApiConstance.detailsMoviePath(id));
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          response.data.map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<WatchListModel> postWatchListMovies(int id) async {
    final response = await MovieDioHelper.postData(url:
    ApiConstance.addToWatchListMoviePath(),
        data:  {
          "media_type": "movie",
          "media_id": id,
          "watchlist": true
        },
    );
    if (response.statusCode == 200) {
      return  WatchListModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
