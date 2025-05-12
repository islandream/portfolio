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
            colors: [Color(0xffcc7108), Color(0xffea9d44)],
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
                    " 캐쥬얼 데이팅 앱 ".text.center.size(andy(isMobile ? 40 : 35)).white.bold.make(),
                    " 다함께 소개팅".text.center.size(andy(isMobile ? 35 : 30)).white.make(),
                  ],
                ),
                "다운로드 10만+".text.center.size(andy(isMobile ? 25 : 20)).white.make(),
                Gap(andy(30)),
                Image.asset(
                  "assets/modu.jpg",
                  width: screenRatio < 0.7 ? screenWidth * 0.9 : screenWidth * 0.6,
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
                          "2016년".text.white.ellipsis.size(andy(20)).align(TextAlign.right).make(),
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
                          "Android Native".text.white.ellipsis.size(andy(20)).align(TextAlign.right).make(),
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
                          "기획, 디자인, 개발, 배포, 마케팅  (Back-end 제외)".text.white.ellipsis.size(andy(20)).align(TextAlign.right).make(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: andy(50)),
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
