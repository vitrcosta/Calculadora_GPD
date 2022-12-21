import 'package:flutter/material.dart';

class InputTitle extends StatelessWidget {
  const InputTitle({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w100,
              color: Colors.white,
              letterSpacing: 2.5,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
