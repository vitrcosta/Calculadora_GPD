import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Clear extends StatelessWidget {
  const Clear({super.key, required this.callback});
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: callback,
      icon: SvgPicture.asset(
        "assets/clear.svg",
        height: 20,
      ),
    );
  }
}
