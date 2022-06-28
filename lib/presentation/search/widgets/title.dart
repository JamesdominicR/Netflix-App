import 'package:flutter/material.dart';

final imageUrl =
    "https://blog-fr.orson.io/wp-content/uploads/2017/06/jpeg-ou-png.jpg";

class SearchTextTitle extends StatelessWidget {
  final String title;
  const SearchTextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
