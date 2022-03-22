import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba_pkm/controller/account_controller.dart';
import 'package:coba_pkm/controller/database_services.dart';
import 'package:coba_pkm/pages/Second_page.dart';
import 'package:coba_pkm/widgets/Button_click.dart';
import 'package:coba_pkm/widgets/My_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

import 'Login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final TextEditingController _controllerPass2 = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  var smallText = TextStyle(fontSize: 12);
  void coba() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPass.text);
      Get.to(() => SecondPage());
      DatabaseService.createOrUpdateUser(
          _controllerEmail.text, _controllerName.text, 0, 0);
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerEmail.dispose();
    _controllerPass.dispose();
    _controllerPass2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Register',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Create your new account',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 32,
                ),
                MyField(
                  prefIcon: Icon(Icons.person),
                  hint: "Full Name",
                  controller: _controllerName,
                  isSafe: false,
                  isEmail: false,
                ),
                MyField(
                  prefIcon: Icon(Icons.mail),
                  hint: "Email",
                  controller: _controllerEmail,
                  isSafe: false,
                  isEmail: true,
                ),
                MyField(
                  prefIcon: Icon(Icons.lock),
                  hint: "Password",
                  controller: _controllerPass,
                  isSafe: true,
                  isEmail: false,
                ),
                MyField(
                  prefIcon: Icon(Icons.lock),
                  hint: "Confirm Password",
                  controller: _controllerPass2,
                  isSafe: true,
                  isEmail: false,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "By signing you agree to our Terms of use and previous notice",
                    textAlign: TextAlign.center,
                    style: smallText,
                  ),
                ),
                SizedBox(
                  height: 64,
                ),
                ButtonClick(nameButton: "Register", destination: coba),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account ? ',
                      style: smallText,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(LoginPage());
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ))
                  ],
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
