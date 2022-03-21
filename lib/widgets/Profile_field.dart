import 'package:flutter/material.dart';

class ProfileField extends StatefulWidget {
  TextEditingController controller;

  bool isEdit;

  ProfileField({required this.controller, required this.isEdit});

  @override
  State<ProfileField> createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<ProfileField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: !widget.isEdit,
      decoration: InputDecoration(
          isDense: true,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  widget.isEdit = !widget.isEdit;
                });
              },
              icon: widget.isEdit ? Icon(Icons.check) : Icon(Icons.edit)),
          filled: widget.isEdit,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          hintStyle: TextStyle(fontSize: 16)),
    );
  }
}
