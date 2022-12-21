import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_de_insumos/app/components/field/input_field.dart';

import '../controllers/calculator_controller.dart';
import 'buttons/buttoncalculate.dart';
import 'field/input_title.dart';

class Liquido extends StatelessWidget {
  const Liquido({super.key, required this.clear, required this.calculate});
  final VoidCallback clear;
  final VoidCallback calculate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTitle(
          title: 'DOSE DO PRODUTO',
          subtitle: '(ml/ton)',
        ),
        InputField(
          length: 3,
          onChanged: (value) {
            if (value.isNotEmpty) {
              dose = double.parse(value);
              validate_1 = 2;
            } else {
              validate_1 = 1;
            }
            CalculatorController.instance.notifyListeners();
          },
          validate: validate_1,
          hint: '16',
          controller: liquid1,
        ),
        InputTitle(
          title: 'CALDA',
          subtitle: '(ml/ton)',
        ),
        InputField(
          length: 5,
          onChanged: (value) {
            if (value.isNotEmpty) {
              calda = double.parse(value);
              validate_2 = 2;
            } else {
              validate_2 = 1;
            }
            CalculatorController.instance.notifyListeners();
          },
          validate: validate_2,
          hint: '1500',
          controller: liquid2,
        ),
        InputTitle(
          title: 'ESTEIRA',
          subtitle: '(ton/horas)',
        ),
        InputField(
          length: 3,
          onChanged: (value) {
            if (value.isNotEmpty) {
              esteira = double.parse(value);
              validate_3 = 2;
            } else {
              validate_3 = 1;
            }
            CalculatorController.instance.notifyListeners();
          },
          validate: validate_3,
          hint: '80',
          controller: liquid3,
        ),
        InputTitle(
          title: 'NÚMERO DE BICOS',
          subtitle: '',
        ),
        InputField(
          length: 2,
          onChanged: (value) {
            if (value.isNotEmpty) {
              bicos = double.parse(value);
              validate_4 = 2;
            } else {
              validate_4 = 1;
            }
            CalculatorController.instance.notifyListeners();
          },
          validate: validate_4,
          hint: '4',
          controller: liquid4,
        ),
        InputTitle(
          title: 'VOLUME DO TANQUE',
          subtitle: '(litros)',
        ),
        InputField(
          length: 4,
          onChanged: (value) {
            if (value.isNotEmpty) {
              tanque = double.parse(value);
              validate_5 = 2;
            } else {
              validate_5 = 1;
            }
            CalculatorController.instance.notifyListeners();
          },
          validate: validate_5,
          hint: '130',
          controller: liquid5,
        ),
        const SizedBox(
          height: 30,
        ),
        ButtonCalculate(
          callback: calculate,
          clear: clear,
        ),
      ],
    );
  }
}
