import 'package:andy_portfolio/pages/first_page.dart';
import 'package:andy_portfolio/pages/page0.dart';
import 'package:andy_portfolio/pages/page3.dart';
import 'package:andy_portfolio/pages/page4.dart';
import 'package:andy_portfolio/pages/page5.dart';
import 'package:andy_portfolio/pages/page6.dart';
import 'package:andy_portfolio/pages/page7.dart';
import 'package:andy_portfolio/pages/page8.dart';
import 'package:andy_portfolio/pages/page9.dart';
import 'package:andy_portfolio/pages/page10.dart';
import 'package:andy_portfolio/pages/second_page.dart';
import 'package:andy_portfolio/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ResponsiveScreen extends StatefulWidget {
  const ResponsiveScreen({super.key});

  @override
  State<ResponsiveScreen> createState() => _ResponsiveScreenState();
}

class _ResponsiveScreenState extends State<ResponsiveScreen> {
  final ScrollController _scrollController = ScrollController();

  bool isScrollBottom = false;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 50) {
      setState(() {
        isScrollBottom = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // 메모리 누수 방지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: LayoutBuilder(
        builder: (context, constraints) {
          screenWidth = constraints.maxWidth;
          screenHeight = constraints.maxHeight;
          screenRatio = screenWidth / screenHeight;
          isMobile = screenRatio < 0.7;
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: titleBarHeight - 1),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: 11,
                  cacheExtent: 1,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        key: ValueKey(index), // 각 아이템을 고유하게 식별
                        child: getPage(index));
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Flutter로 제작된 페이지 입니다.   ",
                  style: TextStyle(fontSize: andy(15), color: Colors.white70),
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     height: andy(100),
              //     decoration: const BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [Color(0x002196F3), Color(0xFF2196F3)],
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //       ),
              //     ),
              //   ),
              // ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: isScrollBottom ? 0 : 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: andy(10), vertical: andy(2)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(andy(5)),
                      color: Colors.black26,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        "Scroll".text.white.size(5).bold.make(),
                        Transform.rotate(angle: 3.14 / 2, child: Icon(Icons.double_arrow_rounded, color: Colors.white, size: andy(30))),
                      ],
                    ),
                  ),
                ),
              ),
              TitleBar(),
            ],
          );
        },
      ),
    );
  }
}

Widget getPage(int index) {
  switch (index) {
    case 0:
      return FirstPage();
    case 1:
      return SecondPage();
    case 2:
      return Page0();
    case 3:
      return Page3();
    case 4:
      return Page4();
    case 5:
      return Page5();
    case 6:
      return Page6();
    case 7:
      return Page7();
    case 8:
      return Page8();
    case 9:
      return Page9();
    case 10:
      return Page10();

    default:
      return SizedBox.shrink();
  }
}

double titleBarHeight = 60;

double screenWidth = 0;
double screenHeight = 0;
double screenRatio = 1;
bool isMobile = false;

double andy(double value) {
  double ratio2 = screenRatio * 0.8;
  double newValue = value * screenWidth / 1300;
  if (ratio2 > 1) {
    newValue = newValue / ratio2;
  }

  return newValue;
}
