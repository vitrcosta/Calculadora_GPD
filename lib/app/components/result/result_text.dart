import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  const ResultText({super.key, required this.value, required this.label});
  final String value;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w700,
              fontSize: 40,
              fontStyle: FontStyle.italic,
              color: Color(0xff1b553e),
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 12,
              color: Color(0xff477e6e),
            ),
          ),
        ],
      ),
    );
  }
}
