import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

import '../../../core/colors/constants.dart';
import '../screen_new_and_hot.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kGreycolor,
                ),
              ),
              Text(
                '11',
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              Row(
                children: [
                  const Text(
                    'TALL GIRL 2',
                    style: TextStyle(
                      letterSpacing: -5,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      // IconButton(
                      //   color: Colors.red,
                      //   icon: Icon(Icons.alarm),
                      //   onPressed: () {},
                      // ),
                      // kheight,
                      // Text('Remind me'),
                      CustomButtonWidget(
                        icon: Icons.arrow_back,
                        title: 'Remind me',
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'Info',
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kwidth,
                    ],
                  ),
                ],
              ),
              kheight,
              Text('Coming on Friday'),
              kheight,
              Text(
                'Tall Girl 2',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight,
              Text(
                'Landing the lead in the school musical is a dream\ncome true for jodi.Until the pressure send her\nconfidence - and her relationship - into a\ntallspain.',
                style: TextStyle(
                  color: kGreycolor,
                ),
              ),
              kheight,
            ],
          ),
        ),
      ],
    );
  }
}
