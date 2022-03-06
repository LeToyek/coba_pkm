import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  Icon prefIcon;
  LoginField({required this.prefIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:
          InputDecoration(prefixIcon: prefIcon, border: InputBorder.none),
    );
  }
}
