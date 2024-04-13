import 'package:assignment_weath/controller/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingView> {
  LocationController locationController = Get.find<LocationController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locationController.geoLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
