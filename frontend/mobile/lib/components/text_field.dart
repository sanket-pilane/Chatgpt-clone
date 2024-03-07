import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        cursorColor: Colors.white,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade600,
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: Colors.black),
          ),
          prefixIcon: Icon(icon),
          labelText: hintText,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
