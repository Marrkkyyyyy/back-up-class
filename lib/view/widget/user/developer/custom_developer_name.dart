import 'package:flutter/material.dart';

class CustomDeveloperName extends StatelessWidget {
  const CustomDeveloperName({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
          fontFamily: "Manrope", fontSize: 22, fontWeight: FontWeight.w600),
    );
  }
}
