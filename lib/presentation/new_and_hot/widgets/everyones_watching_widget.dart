import 'package:flutter/material.dart';
import 'package:netflix_app/api/apivalues.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';

class WatchingWidget extends StatelessWidget {
  final int index;
 const WatchingWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMovies(nowPlaying),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return snapshot.hasData
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        //'Friends',

                        snapshot.data![index].originalTitle,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    kheight,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        // 'This hit sitcoms follows the merry misadventures of six\n20-something palls as they navigate the pilliars-of\nwork,life and love in 1990s Manhatton.',
                        snapshot.data![index].overview,
                        style: const TextStyle(
                          color: kGreycolor,
                        ),
                      ),
                    ),
                    kheight50,
                    VideoWidget(
                      url: imageId + snapshot.data![index].backdropPath,
                    ),
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
                )
              : const Center(
                  child: Text(
                    'Loading....',
                    style: TextStyle(
                      color: kwhiteColor,
                    ),
                  ),
                );
        });
  }
}
