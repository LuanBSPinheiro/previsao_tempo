import 'package:flutter/material.dart';
import 'package:previsao_tempo/model/weather_data_current.dart';
import 'package:previsao_tempo/utils/custom_colors.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
            "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
            height: 80,
            width: 80),
        Container(height: 50, width: 1, color: CustomColors.dividerLine),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "${weatherDataCurrent.current.temp!.toInt()}°",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 68,
                    color: CustomColors.textColorBlack)),
            TextSpan(
                text: "${weatherDataCurrent.current.weather![0].description}",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey)),
          ]),
        ),
      ],
    );
  }
}
