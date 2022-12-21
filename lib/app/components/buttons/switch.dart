import 'package:flutter/material.dart';
import 'package:calculadora_de_insumos/app/controllers/calculator_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SwitchButton extends StatefulWidget {
  SwitchButton();
  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CalculatorController.instance.changeLiquid();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
              width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color.fromRGBO(60, 138, 108, 1),
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: CalculatorController.instance.isLiquid
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                curve: Curves.decelerate,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(243, 202, 74, 1),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
              ),
            ),
            // onTap: () {
            //   CalculatorController.instance.changeLiquid();
            // },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 130,
                child: Row(
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
                ),
              ),
              SizedBox(
                width: 130,
                child: Row(
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
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
