import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acerca de"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "Media Explorer\n\n"
          "Aplicación desarrollada en Flutter.\n"
          "Permite explorar una API externa y administrar una colección personal.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
