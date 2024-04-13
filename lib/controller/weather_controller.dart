import 'package:assignment_weath/repos/weather.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController{

  RxInt temperature = 0.obs;
  RxInt condition = 0.obs;
  RxInt humidity = 0.obs;
  RxString cityName = ''.obs;
  RxString weatherIcon = ''.obs;
  RxString weatherMessage = ''.obs;

  WeatherModelRepo weatherModelRepo = WeatherModelRepo();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    var weatherData =
        await weatherModelRepo.getCurrentLocationWeather();
    updateData(weatherData);
  }

  void updateData(dynamic weatherData) async{
    WeatherModelRepo weatherModelRepo = WeatherModelRepo();
    if (weatherData == null) {
      temperature.value = 0;
      weatherIcon.value = 'Error';
      weatherMessage.value = 'Unable to get weather data';
      cityName.value = '';
      humidity.value = 0;
      return;
    }
    var temp = weatherData['main']['temp'];
    temperature.value = temp.toInt();
    condition.value = weatherData['weather'][0]['id'];
    humidity.value = weatherData['main']['humidity'];
    cityName.value = weatherData['name'];
    weatherIcon.value = weatherModelRepo.getWeatherIcon(condition.value);
    weatherMessage.value = weatherModelRepo.getMessage(temperature.value, cityName.value);
  }

}