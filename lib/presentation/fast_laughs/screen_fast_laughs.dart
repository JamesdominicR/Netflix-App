import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/fast_laughs/api_for_video/video_file.dart';
import 'package:netflix_app/presentation/fast_laughs/widgets/VideoListItem.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(Videos.length, (index) {
            return VideoListItem(index: index,
            uri: Videos[index],
            );
          }),
        ),
      ),
    );
  }
}
