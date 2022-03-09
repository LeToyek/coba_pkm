import 'package:coba_pkm/pages/Login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  User? _activeUser;
  FirebaseAuth _auth = FirebaseAuth.instance;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.off(LoginPage()),
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Container(),
    );
  }
}
