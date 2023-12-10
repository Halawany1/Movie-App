import 'package:dio/dio.dart';
import 'package:wather_app/core/network/api_constance.dart';

class MovieDioHelper {
  static Dio? dio;

  static void initMovie() async {
    dio = await Dio(BaseOptions(
      baseUrl: ApiConstance.baseUrl,
      receiveDataWhenStatusError: true,
      queryParameters: {
        'language': 'en-US',
        'page': 1,
      },
      headers: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjljNmZjNTFkZjNjZDlkMjExYjI5NzJiNjUzZTA5MiIsInN1YiI6IjY0ZmEyNDRjNzk4ZTA2MDBjNTQwMTQ0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.85yQlhr6FW70XbwgbLQIQSTrl2AYODecVqq1O1QIxMg',
        'Accept': 'application/json',
      },
    ));
  }

  static Future<Response> getData({required String url,
    Map<String,dynamic>? query}) async {
    return await dio!.get(url,queryParameters:query);
  }
  static Future<Response> postData(
      {required String url,required Map<String,dynamic> data}) async {
    return await dio!.post(url, data: data);
  }
}

class WatchListDioHelper {
  static Dio? dio;

  static void initWatchList() async {
    dio = await Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/account/',
      receiveDataWhenStatusError: true,
      headers: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjljNmZjNTFkZjNjZDlkMjExYjI5NzJiNjUzZTA5MiIsInN1YiI6IjY0ZmEyNDRjNzk4ZTA2MDBjNTQwMTQ0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.85yQlhr6FW70XbwgbLQIQSTrl2AYODecVqq1O1QIxMg',
        'Accept': 'application/json',
      },
      queryParameters: {
        'language': 'en-US',
        'page': 1,
      },
    ));
  }
  static Future<Response> getData(
      {required String url}) async {
    return await dio!.get(url);
  }
  static Future<Response> postData(
      {required String url,required Map<String,dynamic> data}) async {
    return await dio!.post(url,data:data);
  }
}