import 'package:flutter/material.dart';
import 'package:netflix_app/api/apivalues.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/heading_categories.dart';
import 'card_image.dart';

class ListOfImages extends StatelessWidget {
  const ListOfImages({
    Key? key,
    required this.api,
    required this.title,
  }) : super(key: key);
  final String title;

  final String api;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingCategories(
            text: title, fontsize: 23.sp, padding: EdgeInsets.only(left: 4.w)),
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
              future: getMovies(api),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: snapshot.hasData
                      ? List.generate(
                          snapshot.data!.length,
                          (index) => SizedImage(
                              image:
                                  imageId + snapshot.data![index].posterPath!),
                        )
                      : const [
                          Center(
                            child: Text(
                              "ERROR",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                );
              }),
        ),
      ],
    );
  }
}

class ListOfImagesCount extends StatelessWidget {
  const ListOfImagesCount({
    Key? key,
    required this.title,
    required this.uri,
  }) : super(key: key);
  final String title;

  final String uri;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingCategories(
            text: title, fontsize: 23.sp, padding: EdgeInsets.only(left: 4.w)),
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
              future: getMovies(uri),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: snapshot.hasData
                      ? List.generate(
                          10,
                          (index) => SizedImageCount(
                            image: imageId + snapshot.data![index].posterPath!,
                            index: index,
                          ),
                        )
                      : [const Center(child: Text("ERROR"))],
                );
              }),
        ),
      ],
    );
  }
}

class ListOfImagesRecent extends StatelessWidget {
  const ListOfImagesRecent({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingCategories(
            text: title,
            fontsize: 22.sp,
            padding: EdgeInsets.only(left: 4.w, bottom: 10)),
        LimitedBox(
          maxHeight: 220,
          child: FutureBuilder(
              future: getMovies(nowPlaying),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                return snapshot.hasData
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: List.generate(
                          5,
                          (index) => SizedImageRecent(
                              image:
                                  imageId + snapshot.data![index].posterPath!),
                        ),
                      )
                    : const Center(
                        child: Text(
                          "Loading..",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
              }),
        ),
      ],
    );
  }
}
