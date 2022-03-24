import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba_pkm/controller/account_controller.dart';
import 'package:coba_pkm/controller/database_services.dart';
import 'package:coba_pkm/pages/Register_page.dart';
import 'package:coba_pkm/pages/Third_page.dart';
import 'package:coba_pkm/pages/account_page.dart';
import 'package:coba_pkm/widgets/Circle_child.dart';
import 'package:coba_pkm/widgets/Custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final controller = Get.put(AccountController());
  bool isContinue = false;
  String userEmail = '';
  String name = '';
  String address = '';
  void _funcSetuju() {
    _getCurrentLocation();
    setState(() {
      isContinue = true;
    });
  }

  double longitudeData = 0;
  double latitudeData = 0;

  void _getCurrentLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitudeData = geoposition.latitude;
      longitudeData = geoposition.longitude;
    });
    // var coordinates = Coordinates(latitudeData, longitudeData);
    // var adresses =
    //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // var first = adresses.first;
    // print('${first.featureName} : ${first.addressLine}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Row(
            children: [
              CircleChild(myIcon: Icon(Icons.search), destination: () {}),
              SizedBox(
                width: 16,
              ),
              CircleChild(myIcon: Icon(Icons.person), destination: () {}),
              SizedBox(
                width: 16,
              ),
            ],
          )
        ],
        leading: IconButton(
          onPressed: () => Get.off(RegisterPage()),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        isContinue
            ? Center(
                child: FutureBuilder<DocumentSnapshot>(
                    future: DatabaseService.getUser(_auth.currentUser!.email!),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error blok');
                      } else if (snapshot.hasData && !snapshot.data!.exists) {
                        return Text('Document does not exist');
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        name = data['name'];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  // Get.to(AccountPage(
                                  //   email: _auth.currentUser!.email!,
                                  // ));
                                  Get.to(ThirdPage());
                                },
                                child: Text("go to acc page")),
                            ElevatedButton(
                                onPressed: () async {
                                  await DatabaseService.createOrUpdateUser(
                                      _auth.currentUser!.email!,
                                      name,
                                      latitudeData,
                                      longitudeData);
                                },
                                child: Text('show Location')),
                            Text("Lat = ${latitudeData}"),
                            Text("Long = ${longitudeData}")
                          ],
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              )
            : Center(
                child: CustomDialog(
                funcSetuju: _funcSetuju,
                funcKembali: () {},
              ))
      ]),
    );
  }
}
