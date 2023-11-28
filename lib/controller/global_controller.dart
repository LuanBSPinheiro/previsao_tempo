import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:previsao_tempo/api/fetch_weather.dart';
import 'package:previsao_tempo/model/weather_data.dart';

class GlobalController extends GetxController {
  // Criar algumas variáveis
  final RxBool _isLoading = true.obs;
  final RxDouble _lat = 0.0.obs;
  final RxDouble _lon = 0.0.obs;

  // Instâncias para para chamar as variáveis
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lat;
  RxDouble getLongitude() => _lon;

  final weatherData = WeatherData().obs;

  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // Retorna se o serviço não está habilitado
    if (!isServiceEnabled) {
      return Future.error("Localização não habilitada");
    }

    // Status da permissão
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Permissão de localização foi negada");
    } else if (locationPermission == LocationPermission.denied) {
      // Requesitar a permissão
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Permissão de localização foi negada");
      }
    }

    // Obter a localização atual do usuário
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // Atualiza a latitude e longitude.
      _lat.value = value.latitude;
      _lon.value = value.longitude;

      //Chamando a API
      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }
}
