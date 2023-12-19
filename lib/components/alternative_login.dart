import 'package:flutter/material.dart';

class AlternativeLogin extends StatelessWidget {
  final String imagePath;

  const AlternativeLogin({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}
