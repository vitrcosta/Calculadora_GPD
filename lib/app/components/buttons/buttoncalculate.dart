import 'package:flutter/material.dart';
import 'package:calculadora_de_insumos/app/controllers/calculator_controller.dart';
import 'package:flutter_svg/svg.dart';

import 'clear.dart';

class ButtonCalculate extends StatelessWidget {
  const ButtonCalculate(
      {super.key, required this.callback, required this.clear});
  final VoidCallback callback;
  final VoidCallback clear;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 5,
          child: Clear(callback: clear),
        ),
        Center(
          child: SizedBox(
              width: 180,
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: callback,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "CALCULAR",
                      style: buttonTextStyle,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 2,
                        left: 4,
                      ),
                      child: SvgPicture.asset(
                        'assets/calculate.svg',
                        height: 15.0,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
