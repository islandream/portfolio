import 'package:andy_portfolio/andy_button.dart';
import 'package:andy_portfolio/contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayDialog extends StatefulWidget {
  final String videoId;
  const YoutubePlayDialog({super.key, required this.videoId});

  @override
  State<YoutubePlayDialog> createState() => _YoutubePlayDialogState();
}

class _YoutubePlayDialogState extends State<YoutubePlayDialog> {
  late final dynamic _controller;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
        mute: true,
      ),
    );
    _controller.playVideo();

    _focusNode.requestFocus(); // 키보드 입력을 감지하기 위해 필요

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.escape) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context); // 다이얼로그 닫기
          }
        }
      },
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: YoutubePlayer(
                  controller: _controller,
                  aspectRatio: 16 / 9,
                ),
              ),
              Gap(andy(20)),
              AndyButton(
                width: andy(50),
                color: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: Colors.white, size: andy(50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
