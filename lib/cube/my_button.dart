import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class MyButton extends ButtonComponent {
  MyButton(String text, {super.onPressed, super.onReleased, super.onCancelled, super.position, super.priority, required super.size})
      : super(
            button: ButtonBackground(Colors.white),
            buttonDown: ButtonBackground(Colors.orangeAccent),
            children: [
              TextComponent(
                text: text,
                scale: Vector2(0.7, 0.7),
                size: Vector2(10, 10),
                position: Vector2(size!.x / 2, size!.y / 2),
                anchor: Anchor.center,
              ),
            ],
            anchor: Anchor.center);
}

class ButtonBackground extends PositionComponent with HasAncestor<MyButton> {
  ButtonBackground(Color color) {
    _paint.color = color;
  }

  @override
  void onMount() {
    super.onMount();
    size = ancestor.size;
  }

  late final _background = RRect.fromRectAndRadius(
    size.toRect(),
    const Radius.circular(5),
  );
  final _paint = Paint()..style = PaintingStyle.stroke;

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(_background, _paint);
  }
}
