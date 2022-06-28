import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  bool change = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBox(
                onTap: (value) {
                  setState(() {
                    change = true;
                  });
                },
              ),
              kheight,
              // Expanded(child: const SearchIdleWidget()),
              Expanded(
                child: change ? const SearchResult() : const SearchIdleWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  final void Function(String) onTap;
 const SearchBox({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      backgroundColor: Colors.grey.withOpacity(0.4),
      onSubmitted: onTap,
      prefixIcon: const Icon(
        CupertinoIcons.search,
        color: Colors.grey,
      ),
      suffixIcon: const Icon(
        CupertinoIcons.xmark_circle_fill,
        color: Colors.grey,
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
