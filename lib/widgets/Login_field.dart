import 'package:flutter/material.dart';

class LoginField extends StatefulWidget {
  bool isSafe, isEmail;
  Icon prefIcon;
  String hint;
  TextEditingController controller;
  LoginField(
      {required this.prefIcon,
      required this.hint,
      required this.controller,
      required this.isSafe,
      required this.isEmail});

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          obscureText: widget.isSafe ? isVisible : false,
          keyboardType:
              widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
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
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off))
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
