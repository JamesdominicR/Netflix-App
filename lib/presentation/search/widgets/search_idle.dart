import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/api/apivalues.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';

const imageUrl =
    "https://blog-fr.orson.io/wp-content/uploads/2017/06/jpeg-ou-png.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(
          title: 'Top Searches',
        ),
        kheight,
        Expanded(
            child: FutureBuilder(
                future: getMovies(popularImages),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  return snapshot.hasData
                      ? ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) => TopSearchItem(
                            title: snapshot.data![index].title,
                            image: imageId + snapshot.data![index].backdropPath,
                          ),
                          separatorBuilder: (ctx, index) => kheight20,
                          itemCount: snapshot.data!.length,
                        )
                      : const Center(
                          child: Text(
                            'Loading......',
                            style: TextStyle(
                              color: kwhiteColor,
                            ),
                          ),
                        );
                })),
      ],
    );
  }
}

class TopSearchItem extends StatelessWidget {
  final String image;
  final String title;
  const TopSearchItem({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        kwidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: kwhiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 23,
            child: IconButton(
              icon: const Icon(
                Icons.play_arrow,
                color: kwhiteColor,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
