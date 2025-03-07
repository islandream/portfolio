import 'dart:io';

import 'package:andy_portfolio/andy_button.dart';
import 'package:andy_portfolio/contents.dart';
import 'package:andy_portfolio/image_dialog.dart';
import 'package:andy_portfolio/youtube_play_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Page7 extends StatefulWidget {
  const Page7({super.key});

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFacd3d5), Color(0xFF3dc5ce), Color(0xFFacd3d5)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: andy(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(screenHeight / 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    "5. 캐쥬얼 게임 :".text.white.size(andy(isMobile? 40:35)).bold.make(),
                    " ZigZagUp! (멀티 플레이)".text.white.size(andy(isMobile? 40:35)).make(),
                  ],
                ),
                Gap(andy(30)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(andy(20)),
                  child: Image.asset(
                    "assets/frog_title.jpg",
                    width: screenRatio < 0.7 ? screenWidth * 0.7 : screenWidth * 0.2,
                  ),
                ),
                Gap(andy(30)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                          4,
                          (index) {
                            return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        insetPadding: EdgeInsets.zero,
                                        contentPadding: EdgeInsets.zero,
                                        content: Image.asset("assets/frog_$index.png", height: screenHeight * 0.7)),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(andy(15)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(andy(20)),
                                    child: Image.asset(
                                      "assets/frog_$index.png",
                                      width: screenRatio < 0.7 ? screenWidth * 0.2 : screenWidth * 0.1,
                                    ),
                                  ),
                                ));
                          },
                        )
                      ],
                    ),
                  ],
                ),
                Gap(andy(40)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(andy(20)),
                    Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            "- 제작 년도 :".text.center.white.size(andy(25)).align(TextAlign.right).bold.make(),
                            Gap(andy(20)),
                            "- 프레임워크 :".text.center.white.size(andy(25)).align(TextAlign.right).bold.make(),
                            Gap(andy(20)),
                            "- 담당 포지션 :".text.center.white.size(andy(25)).align(TextAlign.right).bold.make(),
                            Gap(andy(20)),
                            "- 특징 :".text.center.white.size(andy(25)).align(TextAlign.right).bold.make(),
                          ],
                        )),
                    Gap(andy(20)),
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "2015년.".text.white.center.size(andy(25)).align(TextAlign.left).make(),
                          Gap(andy(21)),
                          "Android Native (JAVA)".text.white.center.size(andy(25)).align(TextAlign.left).make(),
                          Gap(andy(21)),
                          "1인 개발".text.white.center.size(andy(25)).align(TextAlign.left).make(),
                          Gap(andy(21)),
                          "멀티 플레이 지원으로 무작위 상대와 1:1 대결 가능.\n상당한 손맛과 속도감.".text.white.center.size(andy(25)).align(TextAlign.left).make(),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(screenHeight / 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
