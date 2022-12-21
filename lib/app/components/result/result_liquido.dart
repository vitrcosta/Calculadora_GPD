import 'package:flutter/material.dart';

import 'result_text.dart';

class ResultLiquido extends StatelessWidget {
  const ResultLiquido({super.key, required this.volume, required this.dosagem});
  final String volume;
  final String dosagem;
  String getCurrencySymbol(String value) =>
      value.replaceAll(RegExp(r'[.]'), ',');
  @override
  Widget build(BuildContext context) {
    var volumeLabel = 'Vazão/bico/min (ml)';
    var dosagemLabel = 'Quantidade de produto no tanque/litros';

    return Column(
      children: [
        Column(
          children: [
            ResultText(
              label: volumeLabel,
              value: getCurrencySymbol(volume),
            ),
            ResultText(
              label: dosagemLabel,
              value: getCurrencySymbol(dosagem),
            ),
          ],
        ),
      ],
    );
  }
}
