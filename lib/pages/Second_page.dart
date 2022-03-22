import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba_pkm/controller/account_controller.dart';
import 'package:coba_pkm/controller/database_services.dart';
import 'package:coba_pkm/pages/Register_page.dart';
import 'package:coba_pkm/pages/account_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  var getEmail = Get.arguments;
  String userEmail = '';
  String name = '';

  // final controller = Get.find<AccountController>();

  void getCurrentUser() async {
    try {
      var currentUser = await _auth.currentUser;
      if (currentUser != null) {
        _activeUser = currentUser;
      }
      userEmail = await _activeUser!.email!;
    } catch (e) {
      print(e);
    }
  }

  void getUserName() async {
    DocumentSnapshot snapshot = await DatabaseService.getUser(userEmail);
    setState(() {
      name = snapshot['name'];
    });
    print("fakkkkk=========>" + name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    _getCurrentLocation();
  }

  double longitudeData = 0;
  double latitudeData = 0;

  void _getCurrentLocation() async {
    // await Geolocator.checkPermission();
    // await Geolocator.requestPermission();
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitudeData = geoposition.latitude;
      longitudeData = geoposition.longitude;
    });
  }

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
                onPressed: () async {
                  _getCurrentLocation();
                  getUserName();
                  await DatabaseService.createOrUpdateUser(userEmail,
                      'Toyek Sudjatmiko', latitudeData, longitudeData);
                  print('latitude = ${latitudeData}');
                  print(userEmail);
                  print(name);
                  // _getCurrentLocation();
                  // print(_currentPosition?.latitude);
                },
                child: Text('show Location')),
            Text("Lat = ${latitudeData}"),
            Text("Long = ${longitudeData}")

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
