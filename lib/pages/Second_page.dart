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
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final controller = Get.put(AccountController());
  String userEmail = '';
  String name = '';

  // final controller = Get.find<AccountController>();

  // void getCurrentUser() {
  //   try {
  //     var currentUser = _auth.currentUser;
  //     if (currentUser != null) {
  //       _activeUser = currentUser;
  //     }
  //     setState(() {
  //       userEmail = _activeUser!.email!;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void getUserName() async {
  //   DocumentSnapshot snapshot = await DatabaseService.getUser(userEmail);
  //   setState(() {
  //     name = snapshot['name'];
  //   });
  // }
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.off(RegisterPage()),
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: latitudeData == 0 && longitudeData == 0
                ? CircularProgressIndicator()
                : FutureBuilder<DocumentSnapshot>(
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
                                  Get.to(AccountPage(
                                    email: _auth.currentUser!.email!,
                                  ));
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
                      return Container();
                    })),
      ),
    );
  }
}
