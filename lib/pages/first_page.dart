import 'package:andy_portfolio/contents.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

bool isFirstPageAlreadyShown = false;

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isShow = false;

  List<String> textList = ["저는 불편한 점을 잘 캐치합니다.", "이것이 서비스 개발자로서 저의 큰 장점입니다."];
  List<double> textSizeList = [55, 38, 30, 40];
  List<bool> showList = [];

  @override
  void initState() {
    showList = List.generate(textList.length, (index) => false);
// 위젯이 그려진 후 애니메이션 실행
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isShow = true;
      });
      if (isFirstPageAlreadyShown) {
        showList = List.generate(textList.length, (index) => true);
        return;
      }
      for (int i = 0; i < textList.length; i++) {
        Future.delayed(
          Duration(milliseconds: i * 2000),
          () {
            if (!mounted) {
              return;
            }
            setState(() {
              showList[i] = true;
            });
          },
        );
      }
      isFirstPageAlreadyShown = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isShow ? 1 : 0,
      duration: Duration(milliseconds: 1000),
      child: Center(
        child: Column(
          children: [
            Gap(screenHeight / 3),
            ...List.generate(
              textList.length,
              (index) => AnimatedOpacity(
                opacity: showList[index] ? 1 : 0,
                duration: Duration(milliseconds: 1000),
                child: textList[index].text.size(andy(textSizeList[index])).white.make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
