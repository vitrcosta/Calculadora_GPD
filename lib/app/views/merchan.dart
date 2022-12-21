import 'package:flutter/material.dart';
import 'package:calculadora_de_insumos/app/components/buttons/button.dart';
import '../components/footer.dart';
import '../components/top.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// final Uri _url = Uri.parse('https://www.gpdvetquimica.com.br/');
_launchUrl() async {
  final response = await http
      .get(Uri.parse('https://gpdvetquimica.com.br/push_mobile_image'));
  final url = jsonDecode(response.body);
  if (await canLaunch(url['url'])) {
    await launch(url['url']);
  } else {
    throw 'Could not launch $url';
  }
}

class Merchan extends StatelessWidget {
  const Merchan({super.key});

  @override
  Widget build(BuildContext context) {
    var src = "https://gpdvetquimica.com.br/mobile/home.jpg";
    return Scaffold(
      appBar: const TopBar(
        title: 'CALCULADORA DE INSUMOS',
        child: Button(),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 10,
                top: 20,
              ),
              child: const Text(
                "OFERECIMENTO:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  letterSpacing: 1,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.9,
                child: GestureDetector(
                  onTap: _launchUrl,
                  child: Image.network(
                    src,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/home.jpg');
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(24, 121, 96, 1),
      bottomNavigationBar: const Footer(),
    );
  }
}
