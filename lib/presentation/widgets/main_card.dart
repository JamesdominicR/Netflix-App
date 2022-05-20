import 'package:flutter/material.dart';

import '../../core/colors/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: kradius20,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://blog-fr.orson.io/wp-content/uploads/2017/06/jpeg-ou-png.jpg'),
          ),
        )
        
        );
  }
}
