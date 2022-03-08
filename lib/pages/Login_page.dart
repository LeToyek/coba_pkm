import 'package:coba_pkm/widgets/Login_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 64,
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
                ),
                LoginField(
                  prefIcon: Icon(Icons.mail),
                  hint: "Email",
                ),
                LoginField(
                  prefIcon: Icon(Icons.lock),
                  hint: "Password",
                ),
                LoginField(
                  prefIcon: Icon(Icons.lock),
                  hint: "Confirm Password",
                ),
                Text(
                  "By signing you agree to our Terms of use and previous notice",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 64,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(24)),
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have account ? '),
                    Text(
                      'Sign in',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
