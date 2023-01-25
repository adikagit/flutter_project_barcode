import 'package:flutter/material.dart';

import '../../scaning/ui/screens/home.dart';

class DescriptionOnboar extends StatelessWidget {
  final String title1;
  final String title2;

  const DescriptionOnboar(
      {super.key, required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 480,
          ),
          Text(
            title1,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kDarkBlueColor,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
