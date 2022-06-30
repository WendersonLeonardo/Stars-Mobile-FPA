import 'package:flutter/material.dart';
import 'package:teste/controlador.dart';
import 'package:teste/home.dart';
//import 'package:teste/pag_inicial.dart';

class TesteMaterial extends StatelessWidget {
  String texto = '';

  TesteMaterial({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Controlador.ctrl,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.amber,
              brightness: Controlador.ctrl.ehDeNoite1
                  ? Brightness.dark
                  : Brightness.light),
          home: const Home1(),
        );
      },
    );
  }
}
