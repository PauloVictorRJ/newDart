// final List<String> videoUrls = [
//   "https://edisciplinas.usp.br/pluginfile.php/5196097/mod_resource/content/1/Teste.mp4",
//   "https://getsamplefiles.com/download/mp4/sample-2.mp4",
//   "https://freetestdata.com/wp-content/uploads/2022/02/Free_Test_Data_15MB_MP4.mp4",
// ];

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const VideoPlayerApp());
}

class VideoPlayerApp extends StatefulWidget {
  const VideoPlayerApp({super.key});

  @override
  _VideoPlayerAppState createState() => _VideoPlayerAppState();
}

class _VideoPlayerAppState extends State<VideoPlayerApp> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VoidCallback _listener;
  late VoidCallback _listener2;
  late VoidCallback _listener3;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "https://edisciplinas.usp.br/pluginfile.php/5196097/mod_resource/content/1/Teste.mp4",
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    _controller2 = VideoPlayerController.network(
        "https://getsamplefiles.com/download/mp4/sample-2.mp4",
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    _controller3 = VideoPlayerController.network(
        "https://freetestdata.com/wp-content/uploads/2022/02/Free_Test_Data_15MB_MP4.mp4",
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));

    _listener = () {
      if (_controller.value.isInitialized &&
          !_controller.value.isPlaying &&
          _controller.value.position == _controller.value.duration) {
        _controller.seekTo(Duration.zero);
        _controller.play();
      }
    };

    _listener2 = () {
      if (_controller2.value.isInitialized &&
          !_controller2.value.isPlaying &&
          _controller2.value.position == _controller2.value.duration) {
        _controller2.seekTo(Duration.zero);
        _controller2.play();
      }
    };

    _listener3 = () {
      if (_controller3.value.isInitialized &&
          !_controller3.value.isPlaying &&
          _controller3.value.position == _controller3.value.duration) {
        _controller3.seekTo(Duration.zero);
        _controller3.play();
      }
    };

    _controller.addListener(_listener);
    _controller.setLooping(false);
    _controller.initialize().then((_) {
      setState(() {});
      _controller.play();
    });

    _controller2.addListener(_listener2);
    _controller2.setLooping(false);
    _controller2.initialize().then((_) {
      setState(() {});
      _controller2.play();
    });

    _controller3.addListener(_listener3);
    _controller3.setLooping(false);
    _controller3.initialize().then((_) {
      setState(() {});
      _controller3.play();
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller2.removeListener(_listener2);
    _controller3.removeListener(_listener3);
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              AspectRatio(
                aspectRatio: _controller2.value.aspectRatio,
                child: VideoPlayer(_controller2),
              ),
              AspectRatio(
                aspectRatio: _controller3.value.aspectRatio,
                child: VideoPlayer(_controller3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
