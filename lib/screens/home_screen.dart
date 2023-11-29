import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:previsao_tempo/controller/global_controller.dart';
import 'package:previsao_tempo/widgets/current_weather_widget.dart';
import 'package:previsao_tempo/widgets/daily_data_forecast.dart';
import 'package:previsao_tempo/widgets/header_widget.dart';
import 'package:previsao_tempo/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Chamada
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(() => globalController.checkLoading().isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const HeaderWidget(),
                  //Para a temperatura atual ('current')
                  CurrentWeatherWidget(
                    weatherDataCurrent:
                        globalController.getData().getCurrentWeather(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HourlyDataWidget(
                      weatherDataHourly:
                          globalController.getData().getHourlyWeather()),
                  DailyDataForecast(
                    weatherDataDaily:
                        globalController.getData().getDailyWeather(),
                  ),
                ],
              ),
            )),
    ));
  }
}
