import 'package:flutter/material.dart';

import 'result_text.dart';

class ResultPilha extends StatelessWidget {
  const ResultPilha({super.key, required this.volume, required this.dosagem});
  final String volume;
  final String dosagem;
  String getCurrencySymbol(String value) =>
      value.replaceAll(RegExp(r'[.]'), ',');
  @override
  Widget build(BuildContext context) {
    var volumeLabel = 'Dosagem do fumigante (m³)';
    var dosagemLabel = 'Dosagem do fumigante (Kg)';

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
