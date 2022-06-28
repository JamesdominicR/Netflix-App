import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/api/apivalues.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

import '../../../core/colors/constants.dart';
import '../screen_new_and_hot.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: getMovies(upComing),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 500,
                    child: Column(
                      children: [
                        Text(
                          DateFormat('MMM').format(DateTime.parse(
                              snapshot.data![index].releaseDate!)),
                          style: const TextStyle(
                            letterSpacing: 2,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kGreycolor,
                          ),
                        ),
                        Text(
                          DateFormat('dd').format(DateTime.parse(
                              snapshot.data![index].releaseDate!)),
                          style: const TextStyle(
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
                        VideoWidget(
                          url: imageId + snapshot.data![index].backdropPath,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                snapshot.data![index].originalTitle,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  letterSpacing: -5,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
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
                        //Text(snapshot.data![index].title),
                        kheight,
                        Text(
                          snapshot.data![index].title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        kheight,
                        SizedBox(
                          width: double.infinity,
                          height: 110,
                          child: Text(
                            //'Landing the lead in the school musical is a dream\ncome true for jodi.Until the pressure send her\nconfidence - and her relationship - into a\ntallspain.',
                            snapshot.data![index].overview,
                            style: const TextStyle(
                              color: kGreycolor,
                            ),
                          ),
                        ),
                        kheight20,
                      ],
                    ),
                  ),
                ],
              );
            });
          } else {
            return const Center(
                child: SizedBox(
                    width: 30, height: 30, child: CircularProgressIndicator()));
          }
        });
  }
}
