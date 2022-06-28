import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/colors/constants.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            actions: [
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
            bottom: TabBar(
                labelColor: backgroundColor,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: Colors.white,
                isScrollable: true,
                indicator:
                    BoxDecoration(color: kwhiteColor, borderRadius: kradius30),
                tabs: const [
                  Tab(text: "🍟 Coming Soon"),
                  Tab(
                    text: "👀 Everyone's watching",
                  ),
                ]),
          ),
        ),
        body: TabBarView(children: [
          _buildComingSoon(),
          _buildEveryonesWatching(),
        ]),
      ),
    );
  }

  Widget _buildComingSoon() {
    return const ComingSoonWidget();
  }

  _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, index) => WatchingWidget(
        index: index,
      ),
    );
  }
}

//creating for custom button widget
class CustomButtonWidget extends StatelessWidget {
  final String title;
  final icon;
  final double iconSize;
  final double textSize;
  const CustomButtonWidget(
      {Key? key,
      required this.title,
      required this.icon,
      this.iconSize = 30,
      this.textSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: iconSize,
        ),
        //kheight,
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
          ),
        ),
      ],
    );
  }
}
