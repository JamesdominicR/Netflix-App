import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => TopSearchItem(),
            separatorBuilder: (ctx, index) => kheight20,
            itemCount: 25,
          ),
        ),
      ],
    );
  }
}



class TopSearchItem extends StatelessWidget {
  const TopSearchItem({Key? key}) : super(key: key);

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
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        kwidth,
        Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
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
              icon: Icon(
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
