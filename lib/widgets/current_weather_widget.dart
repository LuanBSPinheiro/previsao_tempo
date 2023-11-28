import 'package:flutter/material.dart';
import 'package:previsao_tempo/model/weather_data_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Área da temperatura
        temperatureAreaWidget(),
        // Mais detalhes - Velocidade do vento, humidade, nuvens, etc...
        currentWeatherDetailed()
      ],
    );
  }

  Widget currentWeatherDetailed() {
    return Container();
  }

  Widget temperatureAreaWidget() {
    return Row(
      children: [
        Image.asset(
            "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png")
      ],
    );
  }
}
