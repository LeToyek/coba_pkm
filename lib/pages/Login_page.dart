import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba_pkm/controller/account_controller.dart';
import 'package:coba_pkm/pages/Register_page.dart';
import 'package:coba_pkm/pages/Second_page.dart';
import 'package:coba_pkm/pages/account_page.dart';
import 'package:coba_pkm/widgets/Button_click.dart';
import 'package:coba_pkm/widgets/My_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final _auth = FirebaseAuth.instance;
  var smallText = TextStyle(fontSize: 12);
  void coba() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPass.text);
      Get.to(() => AccountPage(), arguments: {'email': _controllerEmail.text});
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
                  'Login',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Log in to your account',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 32,
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
                ButtonClick(nameButton: "Login", destination: coba),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Doesn't have account yet? ",
                      style: smallText,
                    ),
                    InkWell(
                      onTap: () => Get.to(RegisterPage()),
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    )
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
