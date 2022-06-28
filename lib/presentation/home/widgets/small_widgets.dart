import 'package:flutter/material.dart';

class ListOfOption extends StatelessWidget {
  const ListOfOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.mirror,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black,
              Colors.transparent,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const ListAndTextHome(
              icon: Icons.add,
              text: "My List",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: 30,
                child: ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Play",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ),
            const ListAndTextHome(
              icon: Icons.info_outline,
              text: "info",
            ),
          ],
        ),
      ),
    );
  }
}

class ListAndTextHome extends StatelessWidget {
  const ListAndTextHome({Key? key, required this.icon, required this.text})
      : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}