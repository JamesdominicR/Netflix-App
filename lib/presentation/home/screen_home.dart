// import 'package:flutter/material.dart';
// import 'package:netflix_app/api/apivalues.dart';
// import 'package:netflix_app/core/colors/colors.dart';
// import 'package:netflix_app/core/colors/constants.dart';

// class ScreenHome extends StatelessWidget {
//   const ScreenHome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
    
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Stack(
//             children: [
//               //This container is created for the background image//
//               Container(
//                 //check the property//
//                 width: size.height - 80,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Stack(
//                       children: [
//                         Container(
//                           height: 500,
//                           decoration: const BoxDecoration(
//                             color: Colors.green,
//                             image: DecorationImage(
//                               image: NetworkImage(
//                                   "https://blog-fr.orson.io/wp-content/uploads/2017/06/jpeg-ou-png.jpg"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 500,
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                             colors: [
//                               Colors.black.withOpacity(0.85),
//                               Colors.black.withOpacity(0),
//                             ],
//                             end: Alignment.topCenter,
//                             begin: Alignment.bottomCenter,
//                           )),
//                         ),
//                         Container(
//                             height: 500,
//                             width: size.width,
                            
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Image.network(
//                                   'https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABWki_dxQhUmyAO2akksRqcvbGpwkmIXpdUQlDDzvNF1RZqGcJXOsiDjCkmjYWqxAEeMPabyXMZ12Pami3s1wor28tlGqPNqHhOcYibHQUJyMBZfvaw0SFrQk97HiGcB7UkfRk-1by91RcYiBukmed4qL_GrS1E4mAF0oU7xaZxG8-bk6sW14Ow.png?r=4b7',
//                                   width: 300,
//                                 ),
//                                 kheight15,
//                                 const Text(
//                                   'Exciting - Sci -Fi Drama - Sci-Fi Adventure',
//                                   style: TextStyle(
//                                       fontSize: 11, color: kwhiteColor),
//                                 ),
//                               ],
//                             )),
//                       ],
//                     ),
//                     kheight,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           children: const [
//                             Icon(
//                               Icons.add,
//                               color: kwhiteColor,
//                               size: 25,
//                             ),
//                             kheight5,
//                             Text(
//                               'My List',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: kwhiteColor,
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 right: 13, left: 8, top: 2, bottom: 2),
//                             child: Row(
//                               children: const [
//                                 Icon(
//                                   Icons.play_arrow,
//                                   color: backgroundColor,
//                                   size: 30,
//                                 ),
//                                 kwidth5,
//                                 Text(
//                                   'Play',
//                                   style: TextStyle(
//                                     color: kButtoncolorBlack,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         //2nd icon info//
//                         Column(
//                           children: const [
//                             Icon(
//                               Icons.info_outline,
//                               color: kwhiteColor,
//                               size: 25,
//                             ),
//                             kheight5,
//                             Text(
//                               'Info',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     //Creating below page after mylist,Play,info icons//
//                     kheight40,
//                     Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Padding(
//                             padding: const EdgeInsets.only(left: 15),
//                             child: Text(
//                               'My List',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           // SingleChildScrollView(
//                           //   scrollDirection: Axis.horizontal,
//                           //   child: Padding(
//                           //     padding: const EdgeInsets.only(left: 10),
//                           //     child: Row(
//                           //         children: List.generate(4, (index) {
//                           //       return Container(
//                           //         margin: const EdgeInsets.only(right: 8),
//                           //         width: 110,
//                           //         height: 160,
//                           //         decoration: BoxDecoration(
//                           //           image: const DecorationImage(
//                           //             image: NetworkImage(''),
//                           //             fit: BoxFit.cover,
//                           //           ),
//                           //           color: Colors.green,
//                           //           borderRadius: BorderRadius.circular(6),
//                           //         ),
//                           //       );
//                           //     })),
//                           //   ),
//                           // ),
//                         ]),
//                   ],
//                 ),
//               ),
//               Container(
//                 child: Column(children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Image.network(
//                           'https://media.wired.com/photos/592682057034dc5f91bebab8/master/pass/NetflixLogo2016.jpg',
//                           width: 40,
//                           height: 40,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(
//                               Icons.collections_bookmark,
//                               size: 28,
//                             ),
//                             onPressed: () {
//                               getMovies(top10);
//                             },
//                             color: Colors.white,
//                           ),
//                           // IconButton(
//                           //   icon: Image.asset(
//                           //     'https://media.wired.com/photos/592682057034dc5f91bebab8/master/pass/NetflixLogo2016.jpg',
//                           //     width: 26,
//                           //     height: 26,
//                           //     fit: BoxFit.cover,
//                           //   ),
//                           //   onPressed: () {},
//                           // )

//                           Container(
//                             width: 28,
//                             height: 28,
//                             color: Colors.blue,
//                           ),
//                           kwidth,
//                         ],
//                       ),
//                     ],
//                   ),
//                   kheight15,
//                   Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text(
//                           'TV Shows',
//                           style: TextStyle(
//                               fontSize: 15,
//                               color: kwhiteColor,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         const Text(
//                           'Movies',
//                           style: TextStyle(
//                               fontSize: 15,
//                               color: kwhiteColor,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         Row(
//                           children: const [
//                             Text(
//                               'Categories',
//                               style: TextStyle(
//                                   fontSize: 15,
//                                   color: kwhiteColor,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             kwidth3,
//                             Icon(
//                               Icons.keyboard_arrow_down,
//                               color: kwhiteColor,
//                             ),
//                           ],
//                         ),
//                       ]),
//                 ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
