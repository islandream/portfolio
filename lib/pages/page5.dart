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
            colors: [Color(0xFFfce070), Color(0xFFffcc00), Color(0xFFfce070)],
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
                    "3. 캐쥬얼 데이팅 앱 :".text.center.size(andy(isMobile ? 40 : 35)).bold.make(),
                    " 다함께 소개팅 (다운로드 10만+)".text.center.size(andy(isMobile ? 40 : 35)).make(),
                  ],
                ),
                "(현재 서비스 종료)".text.size(andy(20)).make(),
                Gap(andy(30)),
                Image.asset(
                  "assets/modu.jpg",
                  width: screenRatio < 0.7 ? screenWidth * 0.9 : screenWidth * 0.6,
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
                            "- 제작 년도 :".text.center.size(andy(25)).align(TextAlign.right).bold.make(),
                            Gap(andy(20)),
                            "- 프레임워크 :".text.center.size(andy(25)).align(TextAlign.right).bold.make(),
                            Gap(andy(20)),
                            "- 담당 포지션 :".text.center.size(andy(25)).align(TextAlign.right).bold.make(),
                            Gap(andy(20)),
                            "- 서비스 종료 사유 :".text.center.size(andy(25)).align(TextAlign.right).bold.make(),
                          ],
                        )),
                    Gap(andy(20)),
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "2016년.".text.center.size(andy(25)).align(TextAlign.left).make(),
                          Gap(andy(21)),
                          "Android Native".text.center.size(andy(25)).align(TextAlign.left).make(),
                          Gap(andy(21)),
                          "1인개발. (기획, 디자인, 개발, 배포, 마케팅)".text.center.size(andy(25)).align(TextAlign.left).make(),
                          Gap(andy(21)),
                          "앱 퀄리티 미흡, 관리 미흡, 마케팅 미흡".text.center.size(andy(25)).align(TextAlign.left).make(),
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

  Future<void> _launchStore() async {
    String url = "https://play.google.com/store/apps/details?id=com.zikgamez.duckshower&hl=en";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      print("스토어 URL 실행 실패: $url");
    }
  }
}
