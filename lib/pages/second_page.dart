import 'package:andy_portfolio/contents.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
      duration: Duration(milliseconds: 2000),
      child: Center(
        child: Column(
          children: [
            Gap(screenHeight / 3),
            "제가 작업한 몇가지 서비스를 짧게 소개해 보겠습니다.".text.white.center.size(andy(45)).make(),
            //"지금 보시는 페이지는 Flutter로 제작되었습니다.".text.white.center.size(andy(20)).make(),
            Gap(screenHeight / 3),
          ],
        ),
      ),
    );
  }
}
