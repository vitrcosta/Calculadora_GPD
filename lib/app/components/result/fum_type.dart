import 'package:flutter/material.dart';
import 'package:calculadora_de_insumos/app/components/globals.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FumType extends StatelessWidget {
  const FumType({super.key});
  final String fumTitle = 'SILO';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff1b553e),
            borderRadius: BorderRadius.circular(40),
          ),
          child: (() {
            if (isSelected1[0] == true) {
              return Column(
                children: [
                  SvgPicture.asset(
                    'assets/button_silo.svg',
                    height: 80,
                    color: const Color.fromRGBO(243, 202, 74, 1),
                  ),
                ],
              );
            } else if (isSelected2[0] == true) {
              return Column(
                children: [
                  SvgPicture.asset(
                    'assets/button_pilha.svg',
                    height: 80,
                    color: const Color.fromRGBO(243, 202, 74, 1),
                  ),
                ],
              );
            } else if (isSelected3[0] == true) {
              return Column(
                children: [
                  SvgPicture.asset(
                    'assets/button_peso.svg',
                    height: 80,
                    color: const Color.fromRGBO(243, 202, 74, 1),
                  ),
                ],
              );
            }
          }()),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: Text(
            (() {
              if (isSelected1[0] == true) {
                return "SILO";
              } else if (isSelected2[0] == true) {
                return "PILHA";
              } else if (isSelected3[0] == true) {
                return "PESO";
              }
              return '';
            })(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff477e6e),
              fontFamily: "HansomFY",
              fontStyle: FontStyle.italic,
              letterSpacing: 1,
            ),
          ),
        )
      ],
    );
  }
}
