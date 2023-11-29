import 'package:previsao_tempo/model/weather_data_current.dart';
import 'package:previsao_tempo/model/weather_data_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;

  WeatherData([this.current, this.hourly]);

  //Função para obter os valores
  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
}
