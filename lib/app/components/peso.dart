import 'package:flutter/material.dart';

import '../controllers/calculator_controller.dart';
import 'buttons/buttoncalculate.dart';
import 'field/input_field.dart';
import 'field/input_title.dart';

class Peso extends StatefulWidget {
  const Peso({super.key, required this.clear, required this.calculate});
  final VoidCallback clear;
  final VoidCallback calculate;
  final int length = 7;

  @override
  State<Peso> createState() => _PesoState();
}

class _PesoState extends State<Peso> {
  @override
  Widget build(BuildContext context) {
    // List<CulturaModel> items;
    // items = CulturaModel.getCulturas();
    List<String> items = [
      'Milho',
      'Feijão',
      'Soja',
      'Trigo',
      'Arroz (em casca)',
      'Aveia',
      'Café',
      'Café beneficiado'
    ];
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            children: [
              InputTitle(
                title: 'CULTURAS',
                subtitle: '',
              ),
              SizedBox(
                width: 180,
                child: DropdownButtonFormField<String>(
                  alignment: Alignment.center,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(40),
                  ),
                  value: selectedCultura,
                  // icon: const Icon(Icons.arrow_downward),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(17, 90, 71, 1),
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(55, 124, 97, 1),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Ubuntu',
                  ),
                  dropdownColor: const Color.fromRGBO(55, 124, 97, 1),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      selectedCultura = value!;
                    });
                  },
                  items: items.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(value, textAlign: TextAlign.center),
                      ),
                    );
                  }).toList(),
                ),
              ),
              InputTitle(
                title: 'TONELADAS',
                subtitle: '',
              ),
              InputField(
                length: widget.length,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    toneladas = double.parse(value);
                    validate_1 = 2;
                  } else {
                    validate_1 = 1;
                  }
                  CalculatorController.instance.notifyListeners();
                },
                validate: validate_1,
                hint: '000',
                controller: txt3,
              ),
            ],
          ),
        ),
        ButtonCalculate(
          callback: widget.calculate,
          clear: widget.clear,
        ),
      ],
    );
  }
}
