import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  Icon prefIcon;
  String hint;
  LoginField({required this.prefIcon, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              isDense: true,
              prefixIcon: prefIcon,
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              hintText: hint,
              hintStyle: TextStyle(fontSize: 16)),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
