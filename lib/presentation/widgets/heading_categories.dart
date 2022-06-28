//widget for categories title//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingCategories extends StatelessWidget {
  const HeadingCategories({
    Key? key,
    required this.text,
    required this.fontsize,
    required this.padding,
  }) : super(key: key);
  final String text;
  final double fontsize;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding, // EdgeInsets.only(left: 12.w)  Indroducing Downloads for you
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: fontsize.sp),
      ),
    );
  }
}