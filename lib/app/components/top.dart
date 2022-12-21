import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(130);
  const TopBar({super.key, required this.child, required this.title});
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: SizedBox(
        width: 278,
        child: Container(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 3, bottom: 2),
                child: SvgPicture.asset(
                  'assets/calculate.svg',
                  height: 14.0,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 15,
                  letterSpacing: 4,
                  fontFamily: 'HansomFY',
                ),
              ),
            ],
          ),
        ),
      ),
      centerTitle: true,
      toolbarHeight: 30,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: Container(
          margin: const EdgeInsets.only(
            bottom: 25.0,
          ),
          child: child,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
