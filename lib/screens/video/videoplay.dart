// ignore_for_file: prefer_const_constructors

import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';


import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';

class VideoPlay extends StatefulWidget {
  const VideoPlay({super.key, required this.link});
 final String? link;
  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: YoYoPlayer(
            aspectRatio: 16 / 9,
            url: widget.link.toString(),
            videoStyle: VideoStyle(
              qualityStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              forwardAndBackwardBtSize: 30.0,
              playButtonIconSize: 40.0,
              forwardIconColor: Colors.black,
              playIcon: Icon(
                Icons.play_arrow,
                size: 40.0,
                color: Colors.black,
              ),
              pauseIcon: Icon(
                Icons.pause,
                size: 40.0,
                color: Colors.black,
              ),
              videoQualityPadding: EdgeInsets.all(5.0),
            ),
            videoLoadingStyle: VideoLoadingStyle(
              loading: Center(
                child: CircularProgressIndicator(color: mainColor,)
              ),
            ),
            allowCacheFile: true,
            onCacheFileCompleted: (files) {
              print('Cached file length ::: ${files?.length}');
              if (files != null && files.isNotEmpty) {
                for (var file in files) {
                  print('File path ::: ${file.path}');
                }
              }
            },
            onCacheFileFailed: (error) {
              print('Cache file error ::: $error');
            },

            // videoPlayerOptions: v,
            onFullScreen: (value) {
              // Handle fullscreen changes if needed
            },
          ),
        ),
      ),
    );
  }
}
