import 'package:flutter/material.dart';

class ButtonClick extends StatelessWidget {
  String nameButton;
  ButtonClick({required this.nameButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(24)),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: Center(
        child: Text(
          nameButton,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
