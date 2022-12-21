import 'package:flutter/material.dart';
import '../components/liquido.dart';
import '../components/peso.dart';
import '../components/pilha.dart';
import '../components/buttons/switch.dart';
import '../components/buttons/togglebuttons.dart';
import '../components/top.dart';
import '../components/footer.dart';
import '../controllers/calculator_controller.dart';
import '../components/silo.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  final String title;

  @override
  State<Calculator> createState() => _PilhaState();
}

class _PilhaState extends State<Calculator> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'CALCULADORA DE INSUMOS',
        child: AnimatedBuilder(
          animation: CalculatorController.instance,
          builder: (context, child) {
            return SwitchButton();
          },
        ),
      ),
      body: AnimatedBuilder(
        animation: CalculatorController.instance,
        builder: (context, child) {
          return Stack(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Center(
                      child: SizedBox(
                        width: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: CalculatorController.instance.isLiquid
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        MyToggleButtons(),
                                        Container(
                                          child: isSelected1[0]
                                              ? Silo(
                                                  clear: CalculatorController
                                                      .instance.clear,
                                                  calculate:
                                                      CalculatorController
                                                          .instance
                                                          .calculateSilo,
                                                )
                                              : null,
                                        ),
                                        Container(
                                          child: isSelected2[0]
                                              ? Pilha(
                                                  clear: CalculatorController
                                                      .instance.clear,
                                                  calculate:
                                                      CalculatorController
                                                          .instance
                                                          .calculatePilha,
                                                )
                                              : null,
                                        ),
                                        Container(
                                          child: isSelected3[0]
                                              ? Peso(
                                                  clear: CalculatorController
                                                      .instance.clear,
                                                  calculate:
                                                      CalculatorController
                                                          .instance
                                                          .calculatePeso,
                                                )
                                              : null,
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Liquido(
                                          clear: CalculatorController
                                              .instance.clear,
                                          calculate: CalculatorController
                                              .instance.calculateLiquido,
                                        )
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
      backgroundColor: const Color.fromRGBO(24, 121, 96, 1),
      bottomNavigationBar: const Footer(),
    );
  }
}
