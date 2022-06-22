import 'package:flutter/material.dart';
import 'package:teste/pag_cadastro.dart';
import 'package:teste/pag_inicial.dart';
import 'package:teste/pag_novo.dart';
import 'package:teste/pag_recsenha.dart';
import 'pag_login.dart';
import 'pag_scroll.dart';

class Roteador extends StatelessWidget {
  String texto = '';

  Roteador({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const PagLogin(),
        '/lista': (context) => const PagScroll(),
        '/inicial': (context) => PagInicial(texto: texto),
        '/cadastro': (context) => const PagCadastro(),
        '/recsenha': (context) => const PagRecSenha(),
        '/novo': (context) => const PagNovo(),
        //'/teste': (context) => HomePage()
      },
    );
  }
}
