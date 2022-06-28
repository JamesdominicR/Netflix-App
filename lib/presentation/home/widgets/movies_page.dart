import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 25,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(height: index == 0 ? 340 : 0),
                    Text(
                      categoryList[index],
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      color: Colors.transparent,
                      height: index == categoryList.length - 1 ? 200 : 0,
                    )
                  ],
                );
              },
              itemCount: categoryList.length,
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                radius: 25,
                child: Icon(
                  Icons.close,
                  size: 29.sp,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

final List<String> categoryList = ["Home", "TV Shows", "Movies"];