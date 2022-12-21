import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import '../controllers/calculator_controller.dart';
import '../views/calculator.dart';

import 'merchan.dart';
import 'result.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: MaterialApp(
        title: 'Calculadora de Insumos',
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          fontFamily: 'Ubuntu',
        ),
        initialRoute: "/",
        routes: {
          '/': (context) => const Merchan(),
          "/home": (context) =>
              const Calculator(title: "Calculadora de Insumos"),
          "/result": (context) => const Result(),
        },
      ),
    );
  }
}
