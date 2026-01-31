import 'package:andy_portfolio/andy_button.dart';
import 'package:andy_portfolio/contents.dart';
import 'package:andy_portfolio/image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class Page0 extends StatefulWidget {
  const Page0({super.key});

  @override
  State<Page0> createState() => _Page0State();
}

class _Page0State extends State<Page0> {
  bool isShow = false;

  @override
  void initState() {
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
            colors: [
              Color(0xFFE65100),
              Color(0xFFEF6C00),
              Color(0xFFFF9800),
              Color(0xFFE65100),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: andy(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(screenHeight / 12),
                screenRatio < 0.7
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          "Poliq (폴리큐)".text.white.size(andy(36)).bold.make(),
                          "국회 회의록 AI 검색 서비스".text.white.size(andy(24)).make(),
                        ],
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          " Poliq (폴리큐) ".text.white.size(andy(35)).bold.make(),
                          "· 국회 회의록 AI 검색 서비스".text.white.size(andy(24)).make(),
                        ],
                      ),
                      Gap(andy(10)),
                "- 현재 내부 사정으로 서비스 임시 중단 -".text.white.size(andy(20)).make(),
                Gap(andy(30)),
                GestureDetector(
                  onTap: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => ImageDialog(path: "assets/poliq.png"),
                    // );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(andy(20)),
                    child: Image.asset(
                      "assets/poliq.png",
                      width: isMobile ? screenWidth * 0.85 : andy(550),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Gap(andy(35)),
                _infoBox("작업 시기", "2025년 10월 ~ 11월 (디노티시아 재직 중)"),
                SizedBox(height: andy(20)),
                _infoBox("프레임워크", "Flutter (모바일 · 웹 공통)"),
                SizedBox(height: andy(20)),
                _infoBox(
                  "담당",
                  "모바일 · 웹 프론트엔드 개발\n"
                  "국회 회의록 의미검색 서비스 Poliq(폴리큐)의\n"
                  "모바일과 웹 프론트엔드를 담당했습니다.",
                ),
                SizedBox(height: andy(20)),
                _infoBox(
                  "기술 스택",
                  "· Firebase Auth (인증)\n"
                  "· Riverpod (상태관리)\n"
                  "· SSE (답변 스트리밍 표시)\n"
                  "· PDF.js (뷰어 커스터마이징)\n"
                  "· 화면 크기·비율에 따른 반응형 레이아웃",
                ),
                SizedBox(height: andy(45)),
                AndyButton(
                  color: Colors.black38,
                  width: isMobile ? andy(800) : andy(600),
                  height: isMobile ? andy(110) : andy(85),
                  onPressed: _launchNews,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.article_outlined, color: Colors.white, size: andy(24)),
                      Gap(andy(8)),
                      "관련 뉴스 보기 (ZDNet)".text.size(andy(19)).white.bold.make(),
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

  Widget _infoBox(String title, String content) {
    return Container(
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
              title.text.white.ellipsis.size(andy(20)).bold.make(),
            ],
          ),
          SizedBox(height: andy(5)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: andy(19)),
              Expanded(
                child: content.text.white.size(andy(20)).align(TextAlign.left).make(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchNews() async {
    const url = "https://zdnet.co.kr/view/?no=20251014095548";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }
}
