import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/result/result_default.dart';
import '../components/result/result_liquido.dart';
import '../components/result/result_pilha.dart';
import '../components/result/result_type.dart';

import '../components/footer.dart';
import '../components/result/fum_type.dart';
import '../components/top.dart';
import '../controllers/calculator_controller.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'RESULTADO',
        child: AnimatedBuilder(
          animation: CalculatorController.instance,
          builder: (context, child) {
            return const ResultType();
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Center(
            child: Column(
          children: [
            if (CalculatorController.instance.isLiquid == true) ...[
              const FumType()
            ],
            Container(
              child: (() {
                if (result == true) {
                  return ResultDefault(
                    volume: volume.toStringAsFixed(2),
                    dosagem: dosagem.toStringAsFixed(2),
                    dosagemac: dosagemac.toStringAsFixed(2),
                  );
                } else if (resultPilha == true) {
                  return ResultPilha(
                    volume: volume.toStringAsFixed(2),
                    dosagem: dosagem.toStringAsFixed(2),
                  );
                } else if (resultLiquido == true) {
                  return ResultLiquido(
                    volume: volume.toStringAsFixed(2),
                    dosagem: dosagem.toStringAsFixed(2),
                  );
                }
              }()),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    CalculatorController.instance.share();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: SizedBox(
                      width: 230,
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              right: 5,
                            ),
                            child: SvgPicture.asset(
                              'assets/zap.svg',
                              width: 16.0,
                            ),
                          ),
                          const Text(
                            'COMPARTILHAR NO WHATSAPP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.w100,
                              fontSize: 13,
                              color: Color.fromRGBO(54, 56, 69, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: const Footer(),
    );
  }
}
