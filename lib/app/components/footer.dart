import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_launchUrl() async {
  const url = 'https://www.criativitta.com.br/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(17, 90, 71, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 200,
              margin: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'assets/logo-cor.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "POWERED BY ",
                    style: TextStyle(
                      color: Color.fromRGBO(68, 185, 155, 1),
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3,
                    ),
                  ),
                  GestureDetector(
                    onTap: _launchUrl,
                    child: const Text(
                      "CRIATIVITTÁ ",
                      style: TextStyle(
                        color: Color(0xffa1f2d2),
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  const Text(
                    "WEB STUDIO",
                    style: TextStyle(
                      color: Color.fromRGBO(68, 185, 155, 1),
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
