import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {
  final String imagePath;

  SquareImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.white)),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
