
import '../entities/weather.dart';
import '../repository/Base_weather_repository.dart';
class GetWeatherByCountryName{
  final BaseWeatherRepository repository;
  GetWeatherByCountryName(this.repository);

  Future<Weather>excute(String cityName)async{
    return await repository.getWeatherByCityName(cityName);
  }
}