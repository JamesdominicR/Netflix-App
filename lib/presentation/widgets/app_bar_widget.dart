import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/core/colors/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          kwidth,
          Text(title,
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              )),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: Colors.white,
            size: 30,
          ),
          kwidth,
          Container(
            width: 30,
            height: 30,
            color: Colors.blue,
          ),
          kwidth,
        ],
      ),
    );
  }
}
