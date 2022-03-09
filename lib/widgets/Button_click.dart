import 'package:flutter/material.dart';

class ButtonClick extends StatelessWidget {
  String nameButton;
  Function destination;
  ButtonClick({
    required this.nameButton,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        destination();
      },
      child: Container(
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
      ),
    );
  }
}
