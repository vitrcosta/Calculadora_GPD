import 'package:flutter/material.dart';

import 'result_text.dart';

class ResultDefault extends StatelessWidget {
  const ResultDefault(
      {super.key,
      required this.volume,
      required this.dosagem,
      required this.dosagemac});
  final String volume;
  final String dosagem;
  final String dosagemac;
  String getCurrencySymbol(String value) =>
      value.replaceAll(RegExp(r'[.]'), ',');
  @override
  Widget build(BuildContext context) {
    var volumeLabel = 'Volume de grãos armazenados (m³)';
    var dosagemLabel = 'Dosagem do fumigante para demais culturas (Kg)';
    var dosagemacLabel = 'Dosagem do fumigante para Arroz com casca (Kg)';

    return Column(
      children: [
        Column(
          children: [
            ResultText(
              label: volumeLabel,
              value: getCurrencySymbol(volume),
            ),
            ResultText(
              label: dosagemacLabel,
              value: getCurrencySymbol(dosagemac),
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
