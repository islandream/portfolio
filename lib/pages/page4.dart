import 'dart:async';
import 'dart:io';

import 'package:andy_portfolio/andy_button.dart';
import 'package:andy_portfolio/contents.dart';

import 'package:andy_portfolio/youtube_play_dialog.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  late final dynamic _controller;

  bool isShow = false;

  @override
  void initState() {
// 위젯이 그려진 후 애니메이션 실행
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isShow = true;
      });
    });

    prepareController();
  }

  Future<void> prepareController() async {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: "BH-mK5eIXf0",
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
        mute: true,
      ),
    );
    _controller.playVideo();
  }

  @override
  void dispose() {
    //_controller.dispose(); youtube player iframe 의 controller는 dispose할 필요가 없고 하면 에러남.
    super.dispose();
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
            colors: [Color(0xFF8ccf7b), Color(0xFF4bb92e), Color(0xFF8ccf7b)],
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
                    " 캐쥬얼 디펜스 게임 ".text.white.center.size(andy(isMobile ? 40 : 35)).bold.make(),
                    " Duck Shower TD".text.white.center.size(andy(isMobile ? 40 : 35)).make(),
                  ],
                ),
                Gap(andy(5)),
                "<Flutter>".text.white.center.size(andy(isMobile ? 40 : 35)).make(),
                Gap(andy(20)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/duck_shower_logo.png", width: andy(isMobile ? 300 : 250)),
                    SizedBox(width: andy(50)),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(andy(30)),
                          child: SizedBox(
                            width: screenRatio < 0.7 ? screenWidth * 0.9 : screenWidth * 0.5,
                            child: YoutubePlayer(
                              controller: _controller,
                              enableFullScreenOnVerticalDrag: true,
                              aspectRatio: 16 / 9,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: PointerInterceptor(
                              intercepting: true,
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
                                  width: screenRatio < 0.7 ? screenWidth * 0.9 : screenWidth * 0.5,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              _controller.playVideo();
                            },
                            icon: Icon(Icons.play_circle)),
                        IconButton(
                            onPressed: () {
                              _controller.stopVideo();
                            },
                            icon: Icon(Icons.stop_circle)),
                      ],
                    ),
                    //섬네일 클릭해서 다이얼로그로 영상 띄우는건 일단 안함
                    //영상위에 마우스 커서 있을때 스크롤 안되는거 싫으면 이방식으로 다시 돌려
                    Visibility(
                      visible: false,
                      child: AndyButton(
                        width: screenRatio < 0.7 ? screenWidth * 0.7 : screenWidth * 0.4,
                        color: Colors.transparent,
                        shrinkScale: 0.95,
                        borderR: 0,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => YoutubePlayDialog(videoId: 'UST6C8PMN_s'),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(andy(15)),
                                child: Image.network("https://img.youtube.com/vi/UST6C8PMN_s/maxresdefault.jpg")),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.play_circle_outline_rounded,
                                  color: Colors.white,
                                  size: andy(80),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: andy(10)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(andy(5)),
                                    color: Colors.black45,
                                  ),
                                  child: "클릭시 사운드 Off 상태로 재생됩니다.".text.white.size(andy(15)).make(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(andy(30)),
                    screenRatio < 0.7
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...List.generate(
                                6,
                                (index) => Padding(
                                  padding: EdgeInsets.all(andy(10)),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            backgroundColor: Colors.transparent,
                                            insetPadding: EdgeInsets.zero,
                                            contentPadding: EdgeInsets.zero,
                                            content: Image.asset("assets/duck_${index + 1}.jpg", width: screenWidth)),
                                      );
                                    },
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(andy(15)),
                                        child: Image.asset("assets/duck_${index + 1}.jpg", width: screenWidth * 0.8)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...List.generate(
                                2,
                                (index_r) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ...List.generate(
                                      3,
                                      (index_c) => Padding(
                                        padding: EdgeInsets.all(andy(10)),
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                  backgroundColor: Colors.transparent,
                                                  content: Image.asset("assets/duck_${index_r * 3 + index_c + 1}.jpg", width: screenWidth * 0.7)),
                                            );
                                          },
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(andy(15)),
                                              child: Image.asset("assets/duck_${index_r * 3 + index_c + 1}.jpg", width: screenWidth * 0.3)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                          "2024년".text.white.ellipsis.size(andy(20)).align(TextAlign.right).make(),
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
                          "Flutter (with Flame Package)".text.white.ellipsis.size(andy(20)).align(TextAlign.right).make(),
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
                          "1인개발. (기획, 디자인, 개발, 스토어 배포)".text.white.ellipsis.size(andy(20)).align(TextAlign.right).make(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: andy(20)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: andy(25), horizontal: andy(30)),
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
                          "구현한 주요 기능".text.white.ellipsis.size(andy(20)).align(TextAlign.right).bold.make(),
                        ],
                      ),
                      SizedBox(height: andy(10)),
                      Row(
                        children: [
                          SizedBox(width: andy(19)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              "Google Play Game Service 연동".text.white.center.size(andy(20)).align(TextAlign.left).make(),
                              "(로그인, 게임 저장/불러오기, 리더보드 등)".text.white.center.size(andy(20)).align(TextAlign.left).make(),
                              "Admob 광고 연동 (배너/전면 광고)".text.white.center.size(andy(20)).align(TextAlign.left).make(),
                              "인앱 결제 연동".text.white.center.size(andy(20)).align(TextAlign.left).make(),
                              "Isometric 타일 맵 시스템 직접 구현".text.white.center.size(andy(20)).align(TextAlign.left).make(),
                              "타워와 캐릭터 80% 이상 직접 드로잉".text.white.center.size(andy(20)).align(TextAlign.left).make(),
                              "길찾기 로직 구현".text.white.center.size(andy(20)).align(TextAlign.left).make(),
                              "다양한 방법을 통한 프레임(성능) 최적화".text.white.center.size(andy(20)).align(TextAlign.left).make(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(andy(50)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AndyButton(
                      color: Colors.green.shade700,
                      width: isMobile ? andy(900) : andy(700),
                      height: isMobile ? andy(120) : andy(90),
                      onPressed: _launchStore,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.play_arrow_rounded, color: Colors.white, size: andy(25)),
                          Gap(andy(5)),
                          "Duck Shower TD - 구글 스토어 이동".text.size(andy(20)).white.bold.make(),
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
