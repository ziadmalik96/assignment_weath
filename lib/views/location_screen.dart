import 'package:assignment_weath/constant/app_routing.dart';
import 'package:assignment_weath/controller/location_controller.dart';
import 'package:assignment_weath/controller/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/const_widgets.dart';
import '../constant/constant_text.dart';
import '../repos/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  LocationController locationController = Get.find<LocationController>();
  WeatherController weatherController = Get.find<WeatherController>();
  WeatherModelRepo weatherModel = WeatherModelRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        var weatherData =
                            await weatherModel.getCurrentLocationWeather();
                        weatherController.updateData(weatherData);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 30,
                        child:
                            Icon(Icons.location_searching, color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        var typedName = await Get.toNamed(Routes.selectCity);
                        if (typedName != null) {
                          var weatherData =
                              await weatherModel.getCityWeather(typedName);
                          weatherController.updateData(weatherData);
                        }
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 30,
                        child: Icon(Icons.location_on, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.green),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 10.0,
                            blurRadius: 10.0)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${weatherController.temperature.value}°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        weatherController.weatherIcon.value,
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.red),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 10.0,
                            blurRadius: 10.0)
                      ]),
                  child: Text(
                    '${AppText.humidity}: ${weatherController.humidity.value}',
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.orange),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 10.0,
                            blurRadius: 10.0)
                      ]),
                  child: Text(
                    weatherController.weatherMessage.value,
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
