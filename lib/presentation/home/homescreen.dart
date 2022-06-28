

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app/api/apivalues.dart';
import 'package:netflix_app/presentation/home/widgets/list_of_image.dart';
import 'package:netflix_app/presentation/home/widgets/movies_page.dart';
import 'package:netflix_app/presentation/home/widgets/small_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors/constants.dart';
import '../downloads/widgets/screen_downloads.dart';
import 'categories_page.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);
  // final List imageList = [
  //  "https://terrigen-cdn-dev.marvel.com/content/prod/1x/doctorstrangeinthemultiverseofmadness_lob_crd_02_3.jpg",
  // "https://static.metacritic.com/images/products/movies/8/522591463dfe464bc75a8b207247e2a3.jpg",
  // "https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/83-et00062705-25-12-2021-02-47-08.jpg",
  // "https://tvline.com/wp-content/uploads/2020/10/the-good-doctor-season-1-cast-photo.jpg?w=620",
  // ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool change = true;
  List? imageGet;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> scroll = ValueNotifier(true);
    return SafeArea(
      minimum: EdgeInsets.only(top: 35.h),
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: scroll,
          builder: (context, ind, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final direction = notification.direction;

                if (direction == ScrollDirection.reverse) {
                  scroll.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scroll.value = true;
                }
                return true;
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            FutureBuilder(
                                future: getMovies(nowPlaying),
                                builder: (context,
                                    AsyncSnapshot<List<dynamic>> snapshot) {
                                  return snapshot.hasData
                                      ? Container(
                                          width: double.infinity,
                                          height: 600.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(imageId +
                                                  snapshot
                                                      .data![0].posterPath!),
                                            ),
                                          ),
                                        )
                                      : const Center(
                                          child: Text("Loading...."),
                                        );
                                }),
                            const ListOfOption()
                          ],
                        ),
                        ListOfImagesRecent(
                            title: "Continue Watching",
                            image: imageList[0]),
                        const ListOfImages(
                          title: "Popular on Netflix",
                          api: popularImages,
                        ),
                        const ListOfImages(
                          title: "New Release",
                          api: nowPlaying,
                        ),
                        const ListOfImagesCount(
                          uri: top10,
                          title: "Top 10 in india today",
                        ),
                        boxSub5,
                        const ListOfImages(
                          title: "Upcoming",
                          api: upComing,
                        ),
                      ],
                    ),
                    scroll.value
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 5000),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                tileMode: TileMode.mirror,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            width: double.infinity,
                            height: 110,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        "https://pngimg.com/uploads/netflix/netflix_PNG15.png",
                                        width: 20,
                                        height: 35,
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.cast,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 23.w,
                                        height: 23,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.r)),
                                          color: Colors.blue,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  change
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "TV Shows",
                                              style: styleCategory,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  change = false;
                                                });
                                              },
                                              child: Text(
                                                "Movies",
                                                style: styleCategory,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx) =>
                                                        const CategoryPage());
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Categories",
                                                    style: styleCategory,
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx) =>
                                                        const MoviesPage());
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Movies",
                                                    style: styleCategory,
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx) =>
                                                        const CategoryPage());
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Categories",
                                                    style: styleCategory,
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                ],
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}