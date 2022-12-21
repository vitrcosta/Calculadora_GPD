import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_de_insumos/app/controllers/calculator_controller.dart';
import 'package:flutter_svg/svg.dart';

import 'buttons/buttoncalculate.dart';
import 'field/input_field.dart';
import 'field/input_title.dart';

class Silo extends StatelessWidget {
  const Silo({super.key, required this.clear, required this.calculate});
  final VoidCallback clear;
  final VoidCallback calculate;
  final int length = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTitle(
          title: 'ALTURA',
          subtitle: '(metros)',
        ),
        InputField(
          length: length,
          onChanged: (value) {
            if (value.isNotEmpty) {
              altura = double.parse(value);
              validate_1 = 2;
            } else {
              validate_1 = 1;
            }
            CalculatorController.instance.notifyListeners();
          },
          validate: validate_1,
          hint: '000',
          controller: txt,
        ),
        InputTitle(
          title: 'DIÂMETRO',
          subtitle: '(metros)',
        ),
        InputField(
          length: length,
          onChanged: (value) {
            if (value.isNotEmpty) {
              diametro = double.parse(value);
              validate_2 = 2;
            } else {
              validate_2 = 1;
            }
            CalculatorController.instance.notifyListeners();
          },
          validate: validate_2,
          hint: '000',
          controller: txt3,
        ),
        Container(
          padding: const EdgeInsets.all(25.0),
          child: SizedBox(
            width: 120,
            height: 140,
            child: SvgPicture.asset(
              'assets/silo.svg',
            ),
          ),
        ),
        ButtonCalculate(
          callback: calculate,
          clear: clear,
        ),
      ],
    );
  }
}
