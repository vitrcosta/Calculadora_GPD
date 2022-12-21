import 'package:flutter/cupertino.dart';
import 'package:calculadora_de_insumos/app/controllers/calculator_controller.dart';
import 'package:flutter_svg/svg.dart';

class ResultType extends StatelessWidget {
  const ResultType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(243, 202, 74, 1),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: (() {
        if (CalculatorController.instance.isLiquid == false) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'LÍQUIDO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(12, 51, 36, 1),
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 1,
                ),
                child: SvgPicture.asset(
                  'assets/gota.svg',
                  height: 20,
                ),
              ),
            ],
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'FUMIGAÇÃO',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(12, 51, 36, 1),
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                fontSize: 12,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 3,
              ),
              child: SvgPicture.asset(
                'assets/fumigacao.svg',
                height: 20,
              ),
            ),
          ],
        );
      }()),
    );
  }
}
