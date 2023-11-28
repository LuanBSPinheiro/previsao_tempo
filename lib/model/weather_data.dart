import 'package:previsao_tempo/model/weather_data_current.dart';

class WeatherData {
  final WeatherDataCurrent? current;

  WeatherData([this.current]);

  //Função para obter os valores
  WeatherDataCurrent getCurrentWeather() => current!;
}
