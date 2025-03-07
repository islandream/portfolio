import 'package:andy_portfolio/contents.dart';
import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final String path;
  const ImageDialog({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFC977E), Color(0xFFF35271), Color(0xFFFC977E)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(andy(20)),
          ),
          child: Image.asset(path, height: screenHeight)),
    );
  }
}
