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
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Page6 extends StatefulWidget {
  const Page6({super.key});

  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  bool isShow = false;

  late VideoPlayerController _controller_1;
  late VideoPlayerController _controller_2;
  late VideoPlayerController _controller_3;

  @override
  void dispose() {
    _controller_1.dispose();
    _controller_2.dispose();
    _controller_3.dispose();
    super.dispose();
  }

  @override
  void initState() {
// 위젯이 그려진 후 애니메이션 실행
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isShow = true;
      });
    });

    _controller_1 = VideoPlayerController.networkUrl(Uri.parse("https://islandream.github.io/andyportfolio/assets/assets/clips/give_heart.mp4"))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      })
      ..setVolume(0)
      ..setLooping(true)
      ..play();
    _controller_2 = VideoPlayerController.networkUrl(Uri.parse("https://islandream.github.io/andyportfolio/assets/assets/clips/give_gift.mp4"))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      })
      ..setVolume(0)
      ..setLooping(true)
      ..play();
    _controller_3 = VideoPlayerController.networkUrl(Uri.parse("https://islandream.github.io/andyportfolio/assets/assets/clips/take_heart.mp4"))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      })
      ..setVolume(0)
      ..setLooping(true)
      ..play();
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
            colors: [Color(0xFF988ab4), Color(0xFF876fb7), Color(0xFF988ab4)],
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
                    "4. 데이팅 앱 러브레터 Ver.1".text.white.size(andy(isMobile ? 40 : 35)).bold.make(),
                    " : 리뉴얼 전 버전".text.white.size(andy(isMobile ? 40 : 35)).make(),
                  ],
                ),
                Gap(andy(30)),
                Image.asset("assets/loveletter_ver1_title.png", width: andy(180)),
                Gap(andy(10)),
                Image.asset(
                  "assets/loveletter_ver1.png",
                  width: screenRatio < 0.7 ? screenWidth * 0.9 : screenWidth * 0.4,
                  fit: BoxFit.fitWidth,
                ),
                Gap(andy(30)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(andy(30)),
                      child: SizedBox(
                        width: screenRatio < 0.7 ? screenWidth * 0.25 : screenWidth * 0.1,
                        child: _controller_1.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controller_1.value.aspectRatio,
                                child: VideoPlayer(_controller_1),
                              )
                            : const CircularProgressIndicator(),
                      ),
                    ),
                    Gap(andy(50)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(andy(30)),
                      child: SizedBox(
                        width: screenRatio < 0.7 ? screenWidth * 0.25 : screenWidth * 0.1,
                        child: _controller_2.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controller_2.value.aspectRatio,
                                child: VideoPlayer(_controller_2),
                              )
                            : const CircularProgressIndicator(),
                      ),
                    ),
                    Gap(andy(50)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(andy(30)),
                      child: SizedBox(
                        width: screenRatio < 0.7 ? screenWidth * 0.25 : screenWidth * 0.1,
                        child: _controller_3.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controller_3.value.aspectRatio,
                                child: VideoPlayer(_controller_3),
                              )
                            : const CircularProgressIndicator(),
                      ),
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
                          ],
                        )),
                    Gap(andy(20)),
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "2014년.".text.white.center.size(andy(25)).align(TextAlign.left).make(),
                          Gap(andy(21)),
                          "Android Native (JAVA)".text.white.center.size(andy(25)).align(TextAlign.left).make(),
                          Gap(andy(21)),
                          "기획, 디자인, 개발, 스토어 배포, 마케팅".text.white.center.size(andy(25)).align(TextAlign.left).make(),
                          "(서버 파트를 제외한 일체)".text.white.center.size(andy(25)).align(TextAlign.left).make(),
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
