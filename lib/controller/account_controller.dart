import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class AccountController extends GetxController {
  void _getCurrentLocation() async {
    // await Geolocator.checkPermission();
    // await Geolocator.requestPermission();
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    _getCurrentLocation();
    super.onInit();
  }
}
