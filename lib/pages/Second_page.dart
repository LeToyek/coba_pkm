import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba_pkm/controller/account_controller.dart';
import 'package:coba_pkm/pages/Register_page.dart';
import 'package:coba_pkm/pages/account_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  User? _activeUser;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final controller = Get.put(AccountController());

  // final controller = Get.find<AccountController>();

  void getCurrentUser() async {
    try {
      var currentUser = await _auth.currentUser;
      if (currentUser != null) {
        _activeUser = currentUser;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  // Position? _currentPosition;
  // void _getCurrentLocation() async {
  //   await Geolocator.checkPermission();
  //   await Geolocator.requestPermission();
  //   await Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.low,
  //           forceAndroidLocationManager: true)
  //       .then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //     });
  //   }).catchError((e) {
  //     print("error ---->" + e);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.off(RegisterPage()),
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(AccountPage());
                },
                child: Text("go to acc page")),
            ElevatedButton(
                onPressed: () {
                  // _getCurrentLocation();
                  // print(_currentPosition?.latitude);
                },
                child: Text('show Location')),
            // _currentPosition != null
            //     ? Text(
            //         "LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}")
            //     : Text('blom'),
          ],
        ),
      ),
    );
  }
}
