import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

double altura = 0;
double largura = 0;
double comprimento = 0;
double diametro = 0;
double toneladas = 0;
double volume = 0;
double dosagem = 0;
double dosagemac = 0;
double peso = 0;
double cultura = 0;
double dose = 0;
double calda = 0;
double esteira = 0;
double bicos = 0;
double tanque = 0;

bool result = false;
bool resultPilha = false;
bool resultLiquido = false;
String? selectedCultura = 'Milho';

double widthCalculate = 254;

List<bool> isSelected1 = [true];
List<bool> isSelected2 = [false];
List<bool> isSelected3 = [false];

var txt = TextEditingController();
var txt2 = TextEditingController();
var txt3 = TextEditingController();

var liquid1 = TextEditingController();
var liquid2 = TextEditingController();
var liquid3 = TextEditingController();
var liquid4 = TextEditingController();
var liquid5 = TextEditingController();

ScreenshotController screenshotController = ScreenshotController();

const buttonTextStyle = TextStyle(
  fontFamily: "HansomFY",
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.italic,
  fontSize: 16,
  color: Color.fromRGBO(54, 56, 69, 1),
);

var buttonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
  padding: MaterialStateProperty.all<EdgeInsets>(
      const EdgeInsets.fromLTRB(42, 20, 42, 20)),
);

int validate_1 = 0;
int validate_2 = 0;
int validate_3 = 0;
int validate_4 = 0;
int validate_5 = 0;

class CalculatorController extends ChangeNotifier {
  static CalculatorController instance = CalculatorController();
  bool isLiquid = false;
  changeLiquid() {
    isLiquid = !isLiquid;
    clear();
    notifyListeners();
  }

  setSilo(index) {
    isSelected1[index] = true;
    isSelected3[index] = false;
    isSelected2[index] = false;
    clear();
    notifyListeners();
  }

  setPilha(index) {
    isSelected2[index] = true;
    isSelected1[index] = false;
    isSelected3[index] = false;
    clear();
    notifyListeners();
  }

  setPeso(index) {
    isSelected3[index] = true;
    isSelected1[index] = false;
    isSelected2[index] = false;
    clear();
    notifyListeners();
  }

  void calculateSilo() {
    num raio = diametro / 2;
    volume = 3.14159 * raio * raio * altura;
    dosagemac = volume * 0.0072;
    dosagem = volume * 0.0060;
    result = true;
    validate_1 < 2
        ? validate_1 = 1
        : validate_2 < 2
            ? validate_2 = 1
            : navigatorKey.currentState?.pushNamed('/result');
    notifyListeners();
  }

  void calculatePilha() {
    volume = altura * largura * comprimento;
    dosagemac = volume * 0.0072;
    dosagem = volume * 0.0060;
    result = true;
    validate_1 < 2
        ? validate_1 = 1
        : validate_2 < 2
            ? validate_2 = 1
            : validate_3 < 2
                ? validate_3 = 1
                : navigatorKey.currentState?.pushNamed('/result');
    notifyListeners();
  }

  void calculatePeso() {
    if (selectedCultura == 'Milho') {
      cultura = 750;
    } else if (selectedCultura == 'Feijão') {
      cultura = 775;
    } else if (selectedCultura == 'Soja') {
      cultura = 800;
    } else if (selectedCultura == 'Trigo') {
      cultura = 800;
    } else if (selectedCultura == 'Arroz (em casca)') {
      cultura = 580;
    } else if (selectedCultura == 'Aveia') {
      cultura = 412;
    } else if (selectedCultura == 'Café') {
      cultura = 370;
    } else if (selectedCultura == 'Café beneficiado') {
      cultura = 640;
    }
    volume = toneladas / cultura;
    volume = volume * 1000;
    if (selectedCultura == 'Arroz (em casca)') {
      dosagem = volume * 0.0072;
    } else {
      dosagem = volume * 0.0060;
    }
    resultPilha = true;
    validate_1 < 2
        ? validate_1 = 1
        : navigatorKey.currentState?.pushNamed('/result');
    notifyListeners();
  }

  void calculateLiquido() {
    volume = (calda * esteira) / (60 * bicos);
    dosagem = tanque * dose / calda;
    resultLiquido = true;
    // if (validate_1 < 2 ) {
    //   validate_1 = 1;
    // } else {
    //   navigatorKey.currentState?.pushNamed('/result');
    // }
    validate_1 < 2
        ? validate_1 = 1
        : validate_2 < 2
            ? validate_2 = 1
            : validate_3 < 2
                ? validate_3 = 1
                : validate_4 < 2
                    ? validate_4 = 1
                    : validate_5 < 2
                        ? validate_5 = 1
                        : navigatorKey.currentState?.pushNamed('/result');
    notifyListeners();
  }

  void clear() {
    txt.text = "";
    txt2.text = "";
    txt3.text = "";
    liquid1.text = "";
    liquid2.text = "";
    liquid3.text = "";
    liquid4.text = "";
    liquid5.text = "";
    result = false;
    resultPilha = false;
    resultLiquido = false;
    validate_1 = 0;
    validate_2 = 0;
    validate_3 = 0;
    validate_4 = 0;
    validate_5 = 0;
    notifyListeners();
  }

  void closeResult() {
    result = false;
    resultPilha = false;
    resultLiquido = false;
    notifyListeners();
  }

  share() async {
    screenshotController
        .capture(delay: const Duration(milliseconds: 10), pixelRatio: 2.0)
        .then((Uint8List? image) async {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = await File('${directory.path}/image.png').create();
      await imagePath.writeAsBytes(image as Uint8List);
      await Share.shareFiles([imagePath.path]);
    });
  }
}
