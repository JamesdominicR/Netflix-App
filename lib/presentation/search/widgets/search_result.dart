import 'package:flutter/material.dart';
import 'package:netflix_app/api/apivalues.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentation/search/widgets/title.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(
            child: FutureBuilder(
                future: getMovies(top10),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                 // print('hai $top10');
                  return GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1 / 1.5,
                    children: List.generate(
                      20,
                      (index) {
                        return snapshot.hasData
                            ? MainCard(
                                image:
                                    imageId + snapshot.data![index].posterPath!,
                              )
                            : const Center(
                                child: Text(
                                  "...Loading....",
                                  style: TextStyle(
                                    color: kwhiteColor,
                                  ),
                                ),
                              );
                      },
                    ),
                  );
                })),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String image;
  const MainCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMovies(top10),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          );
        });
  }
}
