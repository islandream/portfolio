import 'package:andy_portfolio/contents.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

class TitleBar extends StatefulWidget {
  const TitleBar({super.key});

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  bool isShow = false;
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        setState(() {
          isShow = true;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: isShow ? 0 : -titleBarHeight,
      left: 0,
      right: 0,
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 500),
      child: Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: titleBarHeight,
        color: Colors.lightBlue,
        child: Row(
          children: [
            Gap(10),
            Image.asset(
              "assets/turtle_icon_small.png",
              width: 30,
              height: 30,
              color: Colors.white,
            ),
            Gap(10),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    "프론트엔드 개발자 ".text.white.size(isMobile ? 13 : 15).make(),
                    "신현우 ".text.white.size(isMobile ? 13 : 15).bold.make(),
                    "의 포트폴리오 입니다.".text.white.size(isMobile ? 13 : 15).make(),
                  ],
                ),
                "아래로 스크롤하여 보시면 됩니다.".text.white.size(12).make(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
