import 'dart:convert';

import 'package:previsao_tempo/api/api_key.dart';
import 'package:previsao_tempo/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:previsao_tempo/model/weather_data_current.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  // Processando a data da resposta -> para JSON
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));

    return weatherData!;
  }
}

String apiURL(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?appid=$apiKey&lat=$lat&lon=$lon&units=metric&exclude=minutely&exclude=alerts";
  return url;
}
