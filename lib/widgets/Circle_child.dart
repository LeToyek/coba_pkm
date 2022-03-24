import 'package:flutter/material.dart';

class CircleChild extends StatelessWidget {
  Icon myIcon;
  Function destination;
  CircleChild({required this.myIcon, required this.destination});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => destination,
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.orange.withOpacity(0.6)),
        child: myIcon,
      ),
    );
  }
}
