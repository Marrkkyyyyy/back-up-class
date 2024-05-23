import 'package:flutter/material.dart';

class CustomProfileName extends StatelessWidget {
  const CustomProfileName({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontFamily: "Manrope", fontSize: 24, fontWeight: FontWeight.w700),
    );
  }
}
