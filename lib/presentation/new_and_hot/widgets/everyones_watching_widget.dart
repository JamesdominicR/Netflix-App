import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';

class WatchingWidget extends StatelessWidget {
  const WatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Friends',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        const Text(
          'This hit sitcoms follows the merry misadventures of six\n20-something palls as they navigate the pilliars-of\nwork,life and love in 1990s Manhatton.',
          style: TextStyle(
            color: kGreycolor,
          ),
        ),
        kheight50,
        const VideoWidget(),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
          ],
        )
      ],
    );
  }
}