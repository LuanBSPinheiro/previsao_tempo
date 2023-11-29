import 'dart:convert';

import 'package:previsao_tempo/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:previsao_tempo/model/weather_data_current.dart';
import 'package:previsao_tempo/model/weather_data_hourly.dart';
import 'package:previsao_tempo/utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  // Processando a data da resposta -> para JSON
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString));

    return weatherData!;
  }
}
