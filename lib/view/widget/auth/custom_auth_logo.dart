import 'package:flutter/material.dart';

class CustomAuthLogo extends StatelessWidget {
  const CustomAuthLogo({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 100,
                child: Image.asset(
                 image,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            );
  }
}