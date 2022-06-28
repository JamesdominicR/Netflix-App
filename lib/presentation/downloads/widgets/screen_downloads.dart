import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_app/api/apivalues.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final _widgetList = [
    const _smartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

   // print("$width    $height");

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => const SizedBox(height: 25),
        itemCount: _widgetList.length,
      ),
    );
  }
}
//List of Images
final List imageList = [
   "https://terrigen-cdn-dev.marvel.com/content/prod/1x/doctorstrangeinthemultiverseofmadness_lob_crd_02_3.jpg",
  "https://static.metacritic.com/images/products/movies/8/522591463dfe464bc75a8b207247e2a3.jpg",
  "https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/83-et00062705-25-12-2021-02-47-08.jpg",
  "https://tvline.com/wp-content/uploads/2020/10/the-good-doctor-season-1-cast-photo.jpg?w=620",
  ];

class Section2 extends StatelessWidget {
 const Section2({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: getMovies(top10),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      //  print(snapshot);
        return Column(
          children: [
            const Text(
              'Introduced Downloads for you',
              style: TextStyle(
                color: kwhiteColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            kheight,
            const Text(
              "We'll download a personalized selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            kheight,
            snapshot.hasData
                ? SizedBox(
                    width: size.width,

                    height: size.height * 0.6,
                    //color: Colors.,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            radius: size.width * 0.35,
                          ),
                        ),
                        DownloadImageWidget(
                          imageList: imageId + snapshot.data![0].posterPath!,
                          margin: const EdgeInsets.only(left: 170),
                          angle: 25,
                          size: Size(size.width * 0.35, size.width * 0.55),
                        ),
                        DownloadImageWidget(
                          imageList: imageId + snapshot.data![1].posterPath!,
                          margin: const EdgeInsets.only(right: 150),
                          angle: -25,
                          size: Size(size.width * 0.35, size.width * 0.55),
                          //0.4 ,0.58//
                        ),
                        DownloadImageWidget(
                          imageList: imageId + snapshot.data![2].posterPath!,
                          margin: const EdgeInsets.only(left: 30, bottom: 14),
                          radius: 5,
                          size: Size(size.width * 0.4, size.width * 0.6),
                          //0.45, 0.65//
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    width: size.width,
                    height: size.height * 0.6,
                    //color: Colors.,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            radius: size.width * 0.35,
                          ),
                        ),
                        DownloadImageWidget(
                          imageList: imageList[0],
                          margin: const EdgeInsets.only(left: 170),
                          angle: 25,
                          size: Size(size.width * 0.35, size.width * 0.55),
                        ),
                        DownloadImageWidget(
                          imageList: imageList[1],
                          margin: const EdgeInsets.only(right: 150),
                          angle: -25,
                          size: Size(size.width * 0.35, size.width * 0.55),
                          //0.4 ,0.58//
                        ),
                        DownloadImageWidget(
                          imageList: imageList[2],
                          margin: const EdgeInsets.only(left: 30, bottom: 14),
                          radius: 5,
                          size: Size(size.width * 0.4, size.width * 0.6),
                          //0.45, 0.65//
                        ),
                      ],
                    ),
                  ),
          ],
        );
      },
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtoncolorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Setup',
                style: TextStyle(
                    color: kButtoncolorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: kButtoncolorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'See What you can download',
              style: TextStyle(
                  color: kButtoncolorBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        kwidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          //margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
