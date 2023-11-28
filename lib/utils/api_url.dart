import 'package:previsao_tempo/api/api_key.dart';

String apiURL(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?appid=$apiKey&lat=$lat&lon=$lon&units=metric&exclude=minutely&exclude=alerts&lang=pt_br";
  return url;
}
