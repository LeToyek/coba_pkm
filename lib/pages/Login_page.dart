import 'package:coba_pkm/widgets/Button_click.dart';
import 'package:coba_pkm/widgets/Login_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final TextEditingController _controllerPass2 = TextEditingController();

  var smallText = TextStyle(fontSize: 12);
  void coba() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [],
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
                LoginField(
                  prefIcon: Icon(Icons.person),
                  hint: "Full Name",
                  controller: _controllerName,
                  isSafe: false,
                ),
                LoginField(
                  prefIcon: Icon(Icons.mail),
                  hint: "Email",
                  controller: _controllerEmail,
                  isSafe: false,
                ),
                LoginField(
                  prefIcon: Icon(Icons.lock),
                  hint: "Password",
                  controller: _controllerPass,
                  isSafe: true,
                ),
                LoginField(
                  prefIcon: Icon(Icons.lock),
                  hint: "Confirm Password",
                  controller: _controllerPass2,
                  isSafe: true,
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
                    Text(
                      'Sign in',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
