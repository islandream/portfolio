import 'dart:io';

import 'package:andy_portfolio/andy_button.dart';
import 'package:andy_portfolio/andy_text.dart';
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

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
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
            colors: [Color(0xff00af53), Color(0xff00cc52)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          //color: Colors.white,
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
                    " 영어 단어 및 표현 학습 크로스 퍼즐 ".text.center.size(andy(isMobile ? 40 : 35)).white.bold.make(),
                  ],
                ),
                Gap(andy(50)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    screenRatio < 0.7
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...List.generate(
                                2,
                                (index_v) => Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ...List.generate(
                                      2,
                                      (index_h) => GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                backgroundColor: Colors.transparent,
                                                insetPadding: EdgeInsets.zero,
                                                contentPadding: EdgeInsets.zero,
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    ClipRRect(
                                                        borderRadius: BorderRadius.circular(andy(10)),
                                                        child: Image.asset("assets/${index_h * 2 + index_v + 1}.jpg", width: screenWidth)),
                                                    IconButton(
                                                      onPressed: () => Navigator.pop(context),
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color: Colors.white,
                                                        size: andy(100),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(andy(10)),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(andy(10)),
                                              child: Image.asset("assets/${index_h * 2 + index_v + 1}.jpg", width: screenWidth * 0.45)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...List.generate(
                                4,
                                (index) {
                                  return GestureDetector(
                                      onTap: () {
                                        showDialog(context: context, builder: (context) => ImageDialog(path: "assets/${index + 1}.jpg"));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(andy(10)),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(andy(10)),
                                            child: Image.asset("assets/${index + 1}.jpg", width: andy(230))),
                                      ));
                                },
                              )
                            ],
                          ),
                  ],
                ),
                Gap(andy(40)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: andy(20), horizontal: andy(30)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(andy(20)),
                    color: Colors.black.withValues(alpha: 0.2),
                  ),
                  width: andy(850),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.white, size: andy(7)),
                          SizedBox(width: andy(10)),
                          "작업 년도".text.white.ellipsis.size(andy(20)).align(TextAlign.right).bold.make(),
                        ],
                      ),
                      SizedBox(height: andy(5)),
                      Row(
                        children: [
                          SizedBox(width: andy(19)),
                          "2025년".text.white.ellipsis.size(andy(20)).align(TextAlign.right).make(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: andy(20)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: andy(20), horizontal: andy(30)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(andy(20)),
                    color: Colors.black.withValues(alpha: 0.2),
                  ),
                  width: andy(850),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.white, size: andy(7)),
                          SizedBox(width: andy(10)),
                          "프레임 워크".text.white.ellipsis.size(andy(20)).align(TextAlign.right).bold.make(),
                        ],
                      ),
                      SizedBox(height: andy(5)),
                      Row(
                        children: [
                          SizedBox(width: andy(19)),
                          "Flutter".text.white.ellipsis.size(andy(20)).align(TextAlign.right).make(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: andy(20)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: andy(20), horizontal: andy(30)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(andy(20)),
                    color: Colors.black.withValues(alpha: 0.2),
                  ),
                  width: andy(850),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, color: Colors.white, size: andy(7)),
                          SizedBox(width: andy(10)),
                          "담당 포지션".text.white.ellipsis.size(andy(20)).align(TextAlign.right).bold.make(),
                        ],
                      ),
                      SizedBox(height: andy(5)),
                      Row(
                        children: [
                          SizedBox(width: andy(19)),
                          "1인 개발 (취미작)\n - 퍼즐 구조 자동 생성 코드 구현\n - GPT API 를 이용한 단어 목록 생성"
                              .text
                              .white
                              .ellipsis
                              .size(andy(20))
                              .align(TextAlign.left)
                              .make(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: andy(50)),
                AndyButton(
                  color: Colors.black38,
                  width: isMobile ? andy(800) : andy(600),
                  height: isMobile ? andy(120) : andy(90),
                  onPressed: _launchStore,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.play_arrow_rounded, color: Colors.white, size: andy(25)),
                      Gap(andy(5)),
                      "구글 스토어 이동".text.size(andy(20)).white.bold.make(),
                    ],
                  ),
                ),
                Gap(screenHeight / 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchStore() async {
    String url = "https://play.google.com/store/apps/details?id=com.zikgamez.crossword&hl=ko";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      print("스토어 URL 실행 실패: $url");
    }
  }
}
