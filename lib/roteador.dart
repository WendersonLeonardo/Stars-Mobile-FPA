import 'package:flutter/material.dart';
import 'package:teste/controlador.dart';
import 'package:teste/pag_cadastro.dart';
import 'package:teste/pag_inicial.dart';
import 'pag_login.dart';
import 'pag_scroll.dart';

class Roteador extends StatelessWidget {
  String texto = '';

  Roteador({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.amber,
          brightness: Controlador.ctrl.eh_de_noite
              ? Brightness.dark
              : Brightness.light),
      initialRoute: '/',
      routes: {
        '/': (context) => const PagLogin(),
        '/lista': (context) => const PagScroll(),
        '/inicial': (context) => PagInicial(texto: texto),
        '/cadastro': (context) => const PagCadastro(),
        //'/teste': (context) => HomePage()
      },
    );
  }
}
