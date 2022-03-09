import 'package:flutter/material.dart';

class LoginField extends StatefulWidget {
  bool isSafe;
  Icon prefIcon;
  String hint;
  TextEditingController controller;
  LoginField({
    required this.prefIcon,
    required this.hint,
    required this.controller,
    required this.isSafe,
  });

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          obscureText: isVisible,
          decoration: InputDecoration(
              isDense: true,
              suffixIcon: widget.isSafe
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: isVisible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility))
                  : null,
              prefixIcon: widget.prefIcon,
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              hintText: widget.hint,
              hintStyle: TextStyle(fontSize: 16)),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
