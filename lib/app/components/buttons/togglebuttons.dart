import 'package:flutter/material.dart';
import '../../controllers/calculator_controller.dart';
import 'package:flutter_svg/svg.dart';

class MyToggleButtons extends StatefulWidget {
  const MyToggleButtons({super.key});

  @override
  State<MyToggleButtons> createState() => _MyToggleButtonsState();
}

class _MyToggleButtonsState extends State<MyToggleButtons> {
  @override
  Widget build(BuildContext context) {
    var svgcolor1 = isSelected1[0]
        ? const Color.fromRGBO(243, 202, 74, 1)
        : const Color.fromRGBO(101, 181, 152, 1);
    var svgcolor2 = isSelected2[0]
        ? const Color.fromRGBO(243, 202, 74, 1)
        : const Color.fromRGBO(101, 181, 152, 1);
    var svgcolor3 = isSelected3[0]
        ? const Color.fromRGBO(243, 202, 74, 1)
        : const Color.fromRGBO(101, 181, 152, 1);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  color: const Color(0xff1b553e),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ToggleButtons(
                  isSelected: isSelected1,
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  onPressed: (int index) {
                    CalculatorController.instance.setSilo(index);
                    setState(() {});
                  },
                  children: [
                    SvgPicture.asset(
                      'assets/button_silo.svg',
                      height: 80,
                      color: svgcolor1,
                    ),
                  ],
                ),
              ),
              Text(
                "SILO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: svgcolor1,
                  fontFamily: "HansomFY",
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  color: const Color(0xff1b553e),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ToggleButtons(
                  isSelected: isSelected2,
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  onPressed: (int index) {
                    CalculatorController.instance.setPilha(index);
                    setState(() {
                      //   svgcolor2 = svgpressed;
                      //   svgcolor1 = const Color.fromRGBO(101, 181, 152, 1);
                      //   svgcolor3 = const Color.fromRGBO(101, 181, 152, 1);
                    });
                  },
                  children: [
                    SvgPicture.asset(
                      'assets/button_pilha.svg',
                      height: 80,
                      color: svgcolor2,
                    ),
                  ],
                ),
              ),
              Text(
                "PILHA",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: svgcolor2,
                  fontFamily: "HansomFY",
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  color: const Color(0xff1b553e),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ToggleButtons(
                  isSelected: isSelected3,
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  onPressed: (int index) {
                    CalculatorController.instance.setPeso(index);
                    setState(() {
                      //   svgcolor3 = svgpressed;
                      //   svgcolor2 = const Color.fromRGBO(101, 181, 152, 1);
                      //   svgcolor1 = const Color.fromRGBO(101, 181, 152, 1);
                    });
                  },
                  children: [
                    SvgPicture.asset(
                      'assets/button_peso.svg',
                      height: 80,
                      color: svgcolor3,
                    ),
                  ],
                ),
              ),
              Text(
                "PESO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: svgcolor3,
                  fontFamily: "HansomFY",
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
