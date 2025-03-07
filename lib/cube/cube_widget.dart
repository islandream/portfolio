import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:andy_portfolio/cube/my_button.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CubeWidget extends StatefulWidget {
  const CubeWidget({super.key});

  @override
  State<CubeWidget> createState() => _CubeWidgetState();
}

class _CubeWidgetState extends State<CubeWidget> {
  var game = CubeTest();
  @override
  Widget build(BuildContext context) {
    return Center(
      // 게임을 중앙에 배치
      child: SizedBox(
        width: 200,
        height: 330,
        child: GameWidget(
          backgroundBuilder: (context) {
            //sdfsf
            return Container(
              color: Colors.indigo, // 배경을 투명하게 설정
            );
          },
          game: game,
        ),
      ),
    );
  }
}

class CubeTest extends FlameGame with DragCallbacks {
  final double ratio = 50;
  final double cameraZvalue = 300; //최소 값 대충 ratio 두배
  bool isPerspectiveOn = true;
  late Vector3 dot1;
  late Vector3 dot2;
  late Vector3 dot3;
  late Vector3 dot4;
  late Vector3 dot5;
  late Vector3 dot6;
  late Vector3 dot7;
  late Vector3 dot8;
  late List<Vector3> vectors;
  late CircleComponent circle1;
  late CircleComponent circle2;
  late CircleComponent circle3;
  late CircleComponent circle4;
  late CircleComponent circle5;
  late CircleComponent circle6;
  late CircleComponent circle7;
  late CircleComponent circle8;
  late List<CircleComponent> circles;

  late List<PolygonComponent> surfaces = [];
  //각 surface가 구성하는 dot의 순서 조합.
  final List<List<int>> spotOrder = [
    [0, 1, 2, 3], //예) 1번 surface는 dot 0~4가 필요함(순서중요)
    [4, 5, 6, 7],
    [1, 5, 6, 2],
    [0, 4, 7, 3],
    [0, 4, 5, 1],
    [3, 7, 6, 2]
  ];

  final List<Paint> paintList = [
    BasicPalette.red.paint(),
    BasicPalette.magenta.paint(),
    BasicPalette.lightBlue.paint(),
    BasicPalette.darkPink.paint(),
    BasicPalette.orange.paint(),
    BasicPalette.lightGreen.paint()
  ];

  late TextComponent textComponent;

  @override
  FutureOr<void> onLoad() async {
    dot1 = Vector3(-1, 1, 1) * ratio;
    dot2 = Vector3(1, 1, 1) * ratio;
    dot3 = Vector3(1, -1, 1) * ratio;
    dot4 = Vector3(-1, -1, 1) * ratio;
    dot5 = Vector3(-1, 1, -1) * ratio;
    dot6 = Vector3(1, 1, -1) * ratio;
    dot7 = Vector3(1, -1, -1) * ratio;
    dot8 = Vector3(-1, -1, -1) * ratio;
    vectors = [dot1, dot2, dot3, dot4, dot5, dot6, dot7, dot8];

    circle1 = CircleComponent(position: Vector2(dot1.x, dot1.y), radius: 2, anchor: Anchor.center);
    circle2 = CircleComponent(position: Vector2(dot2.x, dot2.y), radius: 2, anchor: Anchor.center);
    circle3 = CircleComponent(position: Vector2(dot3.x, dot3.y), radius: 2, anchor: Anchor.center);
    circle4 = CircleComponent(position: Vector2(dot4.x, dot4.y), radius: 2, anchor: Anchor.center);
    circle5 = CircleComponent(position: Vector2(dot5.x, dot5.y), radius: 2, anchor: Anchor.center);
    circle6 = CircleComponent(position: Vector2(dot6.x, dot6.y), radius: 2, anchor: Anchor.center);
    circle7 = CircleComponent(position: Vector2(dot7.x, dot7.y), radius: 2, anchor: Anchor.center);
    circle8 = CircleComponent(position: Vector2(dot8.x, dot8.y), radius: 2, anchor: Anchor.center);
    circles = [circle1, circle2, circle3, circle4, circle5, circle6, circle7, circle8];

    //final surfacePaint = BasicPalette.white.paint()..style = PaintingStyle.stroke;

    Paint fff = Paint();
    //final image = await images.load('nine-box.png');
    // fff.shader = ImageShader(
    //   image,
    //   TileMode.decal,
    //   TileMode.decal,
    //   Matrix4.identity().storage,
    // );

    if (isPerspectiveOn) {
      for (int i = 0; i < 6; i++) {
        List<int> order = spotOrder[i];
        var surface = PolygonComponent([
          Vector2(vectors[order[0]].x, vectors[order[0]].y) * cameraZvalue / (cameraZvalue - vectors[order[0]].z),
          Vector2(vectors[order[1]].x, vectors[order[1]].y) * cameraZvalue / (cameraZvalue - vectors[order[0]].z),
          Vector2(vectors[order[2]].x, vectors[order[2]].y) * cameraZvalue / (cameraZvalue - vectors[order[0]].z),
          Vector2(vectors[order[3]].x, vectors[order[3]].y) * cameraZvalue / (cameraZvalue - vectors[order[0]].z),
        ], paint: paintList[i]);
        surfaces.add(surface);
      }
    } else {
      for (int i = 0; i < 6; i++) {
        List<int> order = spotOrder[i];
        var surface = PolygonComponent([
          Vector2(vectors[order[0]].x, vectors[order[0]].y),
          Vector2(vectors[order[1]].x, vectors[order[1]].y),
          Vector2(vectors[order[2]].x, vectors[order[2]].y),
          Vector2(vectors[order[3]].x, vectors[order[3]].y)
        ], paint: paintList[i]);
        surfaces.add(surface);
      }
    }

    world.add(CircleComponent(position: Vector2.zero(), radius: 2)); //센터포인트

    //점그리기
    for (var circle in circles) {
      //world.add(circle);
    }

    //면 그리기
    for (var surface in surfaces) {
      world.add(surface);
    }

    setZIndex();

    final textPaintOn = TextPaint(
      style: const TextStyle(
        color: Colors.white, // 텍스트 색상 변경
        fontSize: 15, // 폰트 크기
        fontWeight: FontWeight.bold, // 폰트 굵기
      ),
    );
    final textPaintOff = TextPaint(
      style: const TextStyle(
        color: Colors.grey, // 텍스트 색상 변경
        fontSize: 15, // 폰트 크기
        fontWeight: FontWeight.normal, // 폰트 굵기
      ),
    );

    textComponent = TextComponent(
      text: isPerspectiveOn ? "원근감 : ON" : "원근감 : OFF",
      position: Vector2(size.x / 2, 50),
      anchor: Anchor.center,
      textRenderer: textPaintOn,
    );

    MyButton myButton = MyButton(
      "원근감 ON/OFF",
      onPressed: () {
        isPerspectiveOn = !isPerspectiveOn;
        textComponent.text = isPerspectiveOn ? "원근감: ON" : "원근감: OFF";
        textComponent.textRenderer = isPerspectiveOn ? textPaintOn : textPaintOff;
        rotateYaxis(0.01); //화면에 바로 반영해주기 위해 미세하게 돌림.
      },
      size: Vector2(135, 35),
      position: Vector2(size.x / 2, 20),
    );

    add(myButton);

    add(textComponent);

    return super.onLoad();
  }

  void rotateYaxis(double angle) {
    //벡터값 재생성
    for (int i = 0; i < vectors.length; i++) {
      Vector3 dot = vectors[i];
      Vector3 newDot = Vector3(dot.x * cos(angle) - dot.z * sin(angle), dot.y, dot.x * sin(angle) + dot.z * cos(angle));
      vectors[i] = newDot;
    }

    // print(dot1);
    // print(vectors[0]);
    //재생성된 벡터값 기반으로 점 위치 재설정
    setAllPosition(vectors, circles);
  }

  void rotateXaxis(double angle) {
    //벡터값 재생성
    for (int i = 0; i < vectors.length; i++) {
      Vector3 dot = vectors[i];
      Vector3 newDot = Vector3(dot.x, dot.y * cos(angle) - dot.z * sin(angle), dot.y * sin(angle) + dot.z * cos(angle));
      vectors[i] = newDot;
    }
    //재생성된 벡터값 기반으로 점 위치 재설정
    setAllPosition(vectors, circles);
  }

  //재생성된 벡터값 기반으로 점 위치 재설정
  void setAllPosition(List<Vector3> vectors, List<CircleComponent> circles) {
    for (int i = 0; i < vectors.length; i++) {
      //점 위치 재설정(점을 그리지 않을거면 필요없음.)
      circles[i].position = Vector2(vectors[i].x, vectors[i].y);
    }

    if (isPerspectiveOn) {
      //원근감표현
      //기준평면은 z=0 인 평면 z 값이 카메라에 가까워지면 더 커보이게(x,y를 크게), 멀어지면 더 작아보이게(x,y를 작게)
      for (int i = 0; i < 6; i++) {
        List<int> order = spotOrder[i];
        surfaces[i].refreshVertices(newVertices: [
          Vector2(vectors[order[0]].x, vectors[order[0]].y) * cameraZvalue / (cameraZvalue - vectors[order[0]].z),
          Vector2(vectors[order[1]].x, vectors[order[1]].y) * cameraZvalue / (cameraZvalue - vectors[order[1]].z),
          Vector2(vectors[order[2]].x, vectors[order[2]].y) * cameraZvalue / (cameraZvalue - vectors[order[2]].z),
          Vector2(vectors[order[3]].x, vectors[order[3]].y) * cameraZvalue / (cameraZvalue - vectors[order[3]].z),
        ]);
      }
    } else {
      //이거는 원근감 표현 X
      for (int i = 0; i < 6; i++) {
        List<int> order = spotOrder[i];
        surfaces[i].refreshVertices(newVertices: [
          Vector2(vectors[order[0]].x, vectors[order[0]].y),
          Vector2(vectors[order[1]].x, vectors[order[1]].y),
          Vector2(vectors[order[2]].x, vectors[order[2]].y),
          Vector2(vectors[order[3]].x, vectors[order[3]].y)
        ]);
      }
    }
  }

  //z-order 설정. 위에 있는게 위로 보이게 priority를 실시간으로 변경(기준은 각면의 4점의 z값의 평균(여기서는 그냥 z값의 합).)
  void setZIndex() {
    List<int> zSumList = [];
    for (int i = 0; i < 6; i++) {
      double zSum = 0;
      for (int j = 0; j < 4; j++) {
        zSum += vectors[spotOrder[i][j]].z;
      }
      zSumList.add(zSum.toInt());
    }

    // 리스트 복사 및 오름차순 정렬
    List<int> sortedNumbers = List.from(zSumList)..sort((a, b) => a.compareTo(b));
    // 각 숫자가 몇 번째로 작은지 찾기
    List<int> zOrder = [];
    for (int i = 0; i < zSumList.length; i++) {
      int rank = sortedNumbers.indexOf(zSumList[i]) + 1;
      zOrder.add(rank);
    }

    for (int i = 0; i < 6; i++) {
      // TODO: 이거 수정 필요 priority 값이 너무 커짐.
      surfaces[i].priority = zOrder[i].toInt();
      //print(zSumList[5 - i].toInt());
    }
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    rotateYaxis(-event.localDelta.x / 50);
    rotateXaxis(-event.localDelta.y / 50);
    setZIndex();
    super.onDragUpdate(event);
  }
}
