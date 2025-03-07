import 'package:andy_portfolio/andy_button.dart';
import 'package:andy_portfolio/contents.dart';
import 'package:andy_portfolio/image_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  bool isShow = false;

  List<VideoPlayerController> controllerList = [];

  @override
  void initState() {
// 위젯이 그려진 후 애니메이션 실행
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isShow = true;
      });
    });
    super.initState();

    controllerList = List.generate(
        7,
        (index) => VideoPlayerController.networkUrl(Uri.parse("https://islandream.github.io/andyportfolio/assets/assets/clips/ll_${index + 1}.mp4"))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          })
          ..setVolume(0)
          ..setLooping(true)
          ..play());
  }

  @override
  void dispose() {
    for (int i = 0; i < controllerList.length; i++) {
      controllerList[i].dispose();
    }
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
            colors: [Color(0xFFFC977E), Color(0xFFF35271), Color(0xFFFC977E)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: andy(0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(screenHeight / 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    "1. 데이팅 앱 :".text.white.size(andy(isMobile ? 40 : 35)).bold.make(),
                    " 러브레터 (다운로드 100만 이상)".text.white.size(andy(isMobile ? 40 : 35)).make(),
                  ],
                ),
                Gap(andy(50)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo_homepage_2.png", width: andy(isMobile ? 350 : 250)),
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
                                                    Image.asset("assets/card${index_h * 2 + index_v + 1}.png", width: screenWidth),
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
                                        child: Image.asset("assets/card${index_h * 2 + index_v + 1}.png", width: screenWidth * 0.45),
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
                                        showDialog(context: context, builder: (context) => ImageDialog(path: "assets/card${index + 1}.png"));
                                      },
                                      child: Image.asset("assets/card${index + 1}.png", width: andy(230)));
                                },
                              )
                            ],
                          ),
                  ],
                ),
                Gap(andy(20)),
                screenRatio < 0.7 ? getClipsVertical() : getClipsHorizontal(),
                Gap(andy(50)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        "- 작업 년도 :".text.white.ellipsis.size(andy(25)).align(TextAlign.right).bold.make(),
                        " ".text.size(andy(25)).make(),
                        "- 프레임워크 :".text.white.ellipsis.size(andy(25)).align(TextAlign.right).bold.make(),
                        " ".text.size(andy(25)).make(),
                        "- 담당 포지션 :".text.white.ellipsis.size(andy(25)).align(TextAlign.right).bold.make(),
                        " ".text.size(andy(25)).make(),
                        " ".text.size(andy(25)).make(),
                        "- 구현한 주요 기능 :".text.white.ellipsis.size(andy(25)).align(TextAlign.right).bold.make(),
                        " ".text.size(andy(25)).make(),
                        " ".text.size(andy(25)).make(),
                        " ".text.size(andy(25)).make(),
                        " ".text.size(andy(25)).make(),
                        " ".text.size(andy(25)).make(),
                        "- 10년 이상 앱 보수 :".text.white.ellipsis.size(andy(25)).align(TextAlign.right).bold.make(),
                      ],
                    ),
                    Gap(andy(40)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        "2024년 (기존 앱을 전체 리뉴얼)".text.white.ellipsis.size(andy(25)).align(TextAlign.right).make(),
                        " ".text.size(andy(25)).make(),
                        "Android Native 개발 후 Flutter로 컨버전 (99% 완료).".text.white.ellipsis.size(andy(25)).align(TextAlign.right).make(),
                        " ".text.size(andy(25)).make(),
                        "기획, 디자인, Front-end 개발, 스토어 배포, 마케팅.".text.white.ellipsis.size(andy(25)).align(TextAlign.right).make(),
                        "(Back-end 를 제외한 일체)".text.white.ellipsis.size(andy(25)).align(TextAlign.right).make(),
                        " ".text.size(andy(25)).make(),
                        "회원 가입, 로그인, 프로필 내용 등록,".text.white.ellipsis.size(andy(25)).align(TextAlign.right).make(),
                        "회원간 채팅 기능, 인앱 결제, PUSH 알림,".text.white.ellipsis.size(andy(25)).align(TextAlign.right).make(),
                        "사진 업로드, 게시글 업로드,".text.white.ellipsis.size(andy(25)).align(TextAlign.right).make(),
                        "휴대폰 본인 인증 연동,".text.white.size(andy(25)).align(TextAlign.right).make(),
                        "여러가지 UI 애니메이션 직접 구현 등.".text.white.size(andy(25)).align(TextAlign.right).make(),
                        " ".text.size(andy(25)).make(),
                        "대규모 앱 리뉴얼 경험,\n"
                                '안드로이드 버전 상승 대응,\n'
                                '구글 정책 변경 대응,\n'
                                '수 만건의 VOC 모니터링 및 대응\n'
                                'Firebase Crashlytics를 통한 ANR 안정화\n'
                                '신규 기능 지속적 추가'
                            .text
                            .white
                            .center
                            .size(andy(25))
                            .align(TextAlign.left)
                            .make(),
                        ' - 지인 피하기 기능,\n - 휴대폰 본인인증,\n - 추천인 등록시 리워드 지급기능,\n - 셀프 소개팅 기능,\n - 계절에 따른 테마 변경 기능 등.'
                            .text
                            .white
                            .center
                            .size(andy(20))
                            .align(TextAlign.left)
                            .make(),
                      ],
                    )
                  ],
                ),
                Gap(andy(50)),
                AndyButton(
                  color: Colors.red,
                  width: isMobile ? andy(800) : andy(600),
                  height: isMobile ? andy(120) : andy(90),
                  onPressed: _launchStore,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.play_arrow_rounded, color: Colors.white, size: andy(25)),
                      Gap(andy(5)),
                      "러브레터 - 구글 스토어 이동".text.size(andy(20)).white.bold.make(),
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
    String url = "https://play.google.com/store/apps/details?id=com.appstard.loveletter";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      print("스토어 URL 실행 실패: $url");
    }
  }

  Widget getClipsHorizontal() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(andy(20)),
          child: SizedBox(
            width: andy(250),
            child: controllerList[0].value.isInitialized
                ? AspectRatio(
                    aspectRatio: controllerList[0].value.aspectRatio,
                    child: VideoPlayer(controllerList[0]),
                  )
                : const CircularProgressIndicator(),
          ),
        ),
        Gap(andy(50)),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: andy(105), right: andy(50), left: andy(50), bottom: andy(120)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(andy(20)),
                child: SizedBox(
                  width: andy(200),
                  child: controllerList[1].value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controllerList[1].value.aspectRatio,
                          child: VideoPlayer(controllerList[1]),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(andy(50)),
                child: SizedBox(
                  width: andy(250),
                  child: controllerList[2].value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controllerList[2].value.aspectRatio,
                          child: VideoPlayer(controllerList[2]),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
            Positioned(
              top: andy(0),
              right: andy(80),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(andy(50)),
                child: SizedBox(
                  width: andy(100),
                  child: controllerList[3].value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controllerList[3].value.aspectRatio,
                          child: VideoPlayer(controllerList[3]),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
        Gap(andy(50)),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: andy(105)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(andy(20)),
                child: SizedBox(
                  width: andy(200),
                  child: controllerList[5].value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controllerList[5].value.aspectRatio,
                          child: VideoPlayer(controllerList[5]),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(andy(50)),
                child: SizedBox(
                  width: andy(100),
                  child: controllerList[6].value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controllerList[6].value.aspectRatio,
                          child: VideoPlayer(controllerList[6]),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
        Gap(andy(50)),
        ClipRRect(
          borderRadius: BorderRadius.circular(andy(20)),
          child: SizedBox(
            width: andy(200),
            child: controllerList[4].value.isInitialized
                ? AspectRatio(
                    aspectRatio: controllerList[4].value.aspectRatio,
                    child: VideoPlayer(controllerList[4]),
                  )
                : const CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  Widget getClipsVertical() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(andy(50)),
          child: SizedBox(
            width: andy(700),
            child: controllerList[0].value.isInitialized
                ? AspectRatio(
                    aspectRatio: controllerList[0].value.aspectRatio,
                    child: VideoPlayer(controllerList[0]),
                  )
                : const CircularProgressIndicator(),
          ),
        ),
        Gap(andy(100)),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: andy(210), right: andy(100), left: andy(100), bottom: andy(310)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(andy(50)),
                child: SizedBox(
                  width: andy(600),
                  child: controllerList[1].value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controllerList[1].value.aspectRatio,
                          child: VideoPlayer(controllerList[1]),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(andy(100)),
                child: SizedBox(
                  width: andy(800),
                  child: controllerList[2].value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controllerList[2].value.aspectRatio,
                          child: VideoPlayer(controllerList[2]),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
            Positioned(
              top: andy(0),
              right: andy(180),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(andy(90)),
                child: SizedBox(
                  width: andy(200),
                  child: controllerList[3].value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controllerList[3].value.aspectRatio,
                          child: VideoPlayer(controllerList[3]),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
        Gap(andy(100)),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: andy(310)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(andy(50)),
                child: SizedBox(
                  width: andy(600),
                  child: controllerList[5].value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controllerList[5].value.aspectRatio,
                          child: VideoPlayer(controllerList[5]),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(andy(150)),
                child: SizedBox(
                  width: andy(300),
                  child: controllerList[6].value.isInitialized
                      ? AspectRatio(
                          aspectRatio: controllerList[6].value.aspectRatio,
                          child: VideoPlayer(controllerList[6]),
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
        Gap(andy(50)),
        ClipRRect(
          borderRadius: BorderRadius.circular(andy(50)),
          child: SizedBox(
            width: andy(700),
            child: controllerList[4].value.isInitialized
                ? AspectRatio(
                    aspectRatio: controllerList[4].value.aspectRatio,
                    child: VideoPlayer(controllerList[4]),
                  )
                : const CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
