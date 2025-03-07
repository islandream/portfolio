import 'package:flutter/material.dart';

class AndyText extends StatelessWidget {
  final String data;
  final double size;
  final bool isBold;
  final Color? color;
  final double height;
  final TextAlign textAlign;
  final bool isEllipsis;
  const AndyText(
    this.data, {
    super.key,
    this.size = 14.5,
    this.isBold = false,
    this.color,
    this.height = 1.5,
    this.textAlign = TextAlign.center,
    this.isEllipsis = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      overflow: isEllipsis ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        height: height,
        color: color ?? Colors.black87,
      ),
    );
  }
}
