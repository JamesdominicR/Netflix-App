import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/colors/constants.dart';
import '../../widgets/bordered_text.dart';

class SizedImage extends StatelessWidget {
  const SizedImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 180,
          width: 120, //133
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
          ),
        ),
        boxWidth
      ],
    );
  }
}

class SizedImageCount extends StatelessWidget {
  const SizedImageCount({Key? key, required this.image, required this.index})
      : super(key: key);

  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        boxWidth30,
        Stack(
          alignment: Alignment.bottomLeft,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 180.h,
              width: 120.w, //133
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.fill),
              ),
            ),
            Positioned(
              bottom: -30,
              left: -38,
              child: BorderedText(
                  strokeColor: Colors.white,
                  strokeWidth: 2,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 180.sp,
                        decorationColor: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
        boxWidth
      ],
    );
  }
}

class SizedImageRecent extends StatelessWidget {
  const SizedImageRecent({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 160,
                  width: 120, //133
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              ],
            ),
            Container(
              width: 120,
              height: 40,
              color: Colors.grey[850],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
        boxWidth
      ],
    );
  }
}