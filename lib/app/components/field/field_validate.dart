import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controllers/calculator_controller.dart';

class FieldValidate extends StatelessWidget {
  const FieldValidate({super.key, required this.validate});
  final int validate;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      right: 20,
      child: AnimatedBuilder(
        animation: CalculatorController.instance,
        builder: (context, child) {
          return Align(
            alignment: Alignment.centerRight,
            child: (() {
              if (validate == 2) {
                return SvgPicture.asset(
                  'assets/valido.svg',
                  height: 18,
                );
              }
              if (validate == 1) {
                return SvgPicture.asset(
                  'assets/invalido.svg',
                  height: 18,
                );
              }
            }()),
          );
        },
      ),
    );
  }
}
