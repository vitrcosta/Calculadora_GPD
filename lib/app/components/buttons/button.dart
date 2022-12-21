import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.fromLTRB(40, 20, 40, 20)),
      ),
      onPressed: (() {
        Navigator.of(context).pushReplacementNamed('/home');
      }),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "CONTINUAR",
            style: TextStyle(
              fontFamily: "HansomFY",
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: Color.fromRGBO(54, 56, 69, 1),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 2,
              left: 4,
            ),
            child: SvgPicture.asset(
              'assets/continue.svg',
              height: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
