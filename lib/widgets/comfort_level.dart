import 'package:flutter/material.dart';
import 'package:previsao_tempo/model/weather_data_current.dart';
import 'package:previsao_tempo/utils/custom_colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child:
              const Text("Nível de conforto", style: TextStyle(fontSize: 18)),
        ),
        SizedBox(
          height: 180,
          child: Column(children: [
            Center(
              child: SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                        handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                    infoProperties: InfoProperties(
                        bottomLabelText: "Umidade",
                        bottomLabelStyle: const TextStyle(
                            letterSpacing: 0.1, fontSize: 14, height: 1.4)),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor:
                            CustomColors.firstGradientColor.withAlpha(100),
                        progressBarColors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor
                        ])),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                        text: "Sensação Térmica ",
                        style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: "${weatherDataCurrent.current.feelsLike}",
                        style: const TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400))
                  ]),
                ),
                Container(
                  height: 25,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: 1,
                  color: CustomColors.dividerLine,
                ),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                        text: "Raios UV ",
                        style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: "${weatherDataCurrent.current.uvIndex}",
                        style: const TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400))
                  ]),
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
}
