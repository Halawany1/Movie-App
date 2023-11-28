import 'dart:convert';
import '../../core/utils/app_constant.dart';
import '../../domain/entities/weather.dart';
import 'package:dio/dio.dart';

import '../models/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherByCountryName(String countryName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherByCountryName(String countryName) async {
    try {
      Response response = await Dio()
          .get(
          '${AppConstant.baseUrl}/weather?q=$countryName&appid=${AppConstant
              .apiKey}');
      print(response.data.toString());
      return WeatherModel.formJson(response.data);

    }catch(error){
      print(error);
      return null;
    }

  }
}
