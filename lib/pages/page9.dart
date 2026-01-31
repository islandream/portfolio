import 'dart:io';

import 'package:andy_portfolio/andy_button.dart';
import 'package:andy_portfolio/contents.dart';
import 'package:andy_portfolio/cube/cube_widget.dart';
import 'package:andy_portfolio/image_dialog.dart';
import 'package:andy_portfolio/youtube_play_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Page9 extends StatefulWidget {
  const Page9({super.key});

  @override
  State<Page9> createState() => _Page9State();
}

class _Page9State extends State<Page9> {
  bool isShow = false;

  @override
  void initState() {
// 위젯이 그려진 후 애니메이션 실행
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isShow = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isShow ? 1 : 0,
      duration: Duration(milliseconds: 1500),
      child: Container(
        width: double.infinity,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.indigo, Colors.indigo],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(screenHeight / 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                "기타. Flutter로 만들어본 3D 큐브".text.white.center.size(andy(isMobile ? 45 : 35)).bold.make(),
              ],
            ),
            "별거 아니지만 최근 재미있게 만들었던 것이라 첨부해 봤습니다".text.white.center.size(andy(35)).make(),
            "360도 돌려보세요. (마우스 또는 터치)".text.white.center.size(andy(35)).make(),
            Gap(andy(30)),
            CubeWidget(),
            "Flutter가 3D를 지원하지 않지만\nVector3와 삼각함수를 이용해 2D를 3D로 보이게 만들어 보았습니다. ".text.white.center.size(andy(25)).make(),
            "3D 엔진이라는 것도 로우 레벨에서는 결국 이런식으로 작동하지 않을까 하는 생각을 해보았습니다.".text.white.center.size(andy(20)).make(),
          ],
        ),
      ),
    );
  }
}
