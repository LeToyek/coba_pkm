import 'package:coba_pkm/widgets/Login_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Register',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            Text(
              'Create your new account',
              style: TextStyle(fontSize: 16),
            ),
            LoginField(
              prefIcon: Icon(Icons.person),
            ),
            LoginField(prefIcon: Icon(Icons.mail))
          ],
        ),
      )),
    );
  }
}
