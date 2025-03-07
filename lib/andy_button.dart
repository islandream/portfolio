import 'package:flutter/material.dart';

//Made by Andy
//만든이유: 제일 많이 쓰이는 text가 들어간 버튼이 기기별로 사이즈가 달라짐.
//이것도 약간 달라지긴 하는데 훨씬 나음.
//아무위젯이나 child로 받으면됨.(아이콘 필요하면 Row로 받아와)

class AndyButton extends StatefulWidget {
  final double? width;
  final double? height;
  final Color color;
  final Color? strokeColor;
  final double? strokeWidth;
  final double? shrinkScale;
  final Function onPressed;
  final Widget child;
  final double? borderR;
  final double? paddingVertical;
  final double? paddingHorizontal;

  const AndyButton({
    super.key,
    this.width,
    this.height,
    this.color = Colors.blue,
    this.strokeColor,
    this.strokeWidth = 0.5,
    this.shrinkScale = 0.9,
    required this.onPressed,
    required this.child,
    this.borderR = 10,
    this.paddingHorizontal,
    this.paddingVertical,
  });

  @override
  State<AndyButton> createState() => _AndyButtonState();
}

class _AndyButtonState extends State<AndyButton> {
  double _scale = 1.0; //터치시 작았다 커지는 애니메이션 스케일 값
  bool canTouch = true; //빠르게 두번 터치 되는것 방지

  @override
  void initState() {
    super.initState();
  }

  // 터치시 카트 작아졌다 커지는
  void _doScaleAnimation() {
    setState(() {
      _scale = widget.shrinkScale!; // 터치가 끝나면 약간 작아짐
    });
    // 일정 시간이 지나면 원래 크기로 돌아감
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _scale = 1.0; // 다시 원래 크기로 돌아옴
      });
    });
  }

  // void _changeColor() {
  //   setState(() {
  //     //buttonColor = widget.pressedColor!;
  //   });
  //   Future.delayed(const Duration(milliseconds: 200), () {
  //     setState(() {
  //       buttonColor = widget.color!;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        //_changeColor();
        //print("touched");
      },
      onTap: () async {
        if (!canTouch) {
          return;
        }
        canTouch = false;
        _doScaleAnimation();
        Future.delayed(
          const Duration(milliseconds: 200),
          () {
            widget.onPressed();
          },
        );
        await Future.delayed(const Duration(milliseconds: 500)); //0.5초동안 더블터치 방지
        canTouch = true;
      },
      onTapCancel: () {},
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: widget.paddingVertical ?? 0, horizontal: widget.paddingHorizontal ?? 0),
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.borderR!),
            border: widget.strokeColor == null ? null : Border.all(color: widget.strokeColor!, width: widget.strokeWidth!),
          ),
          child: Center(child: widget.child),
        ),
      ),
    );
  }
}
