import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui show FlutterView, Image;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;

class CubeSurface extends PolygonComponent with HasGameRef {
  CubeSurface(super.vertices, {super.paint, super.anchor});

  late final Sprite myTexture;
  late ui.Image _image;
  late final image;
  @override
  FutureOr<void> onLoad() async {
    myTexture = await game.loadSprite('nine-box.png');
    final ByteData data = await rootBundle.load('assets/images/pizza.png');
    final ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final ui.FrameInfo fi = await codec.getNextFrame();
    _image = fi.image;
    image = await game.images.load('nine-box.png');

    //add(Goblin(position: Vector2(size.x / 2, size.y / 2 + 50), size: Vector2(88, 60)));

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    //paintImage(canvas: canvas, rect: Rect.fromLTWH(0, 0, 100, 100), image: image);
    canvas.save();
    canvas.skew(0.5, 0.5);

    //myTexture.render(canvas, position: Vector2.zero(), size: size);
    super.render(canvas);
  }
}
