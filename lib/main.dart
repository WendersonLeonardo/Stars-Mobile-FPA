import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'roteador.dart';

void main() {
  runApp(Roteador());
}
/*
class DeTeste extends StatelessWidget {
  final String nome1;
  int cont = 0;

  const DeTeste({Key? key, required this.nome1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: GestureDetector(
        child: Text(
          'uawei $cont',
          style: TextStyle(color: Colors.blueAccent, fontSize: 38.0),
        ),
        onTap: () {
          setState(() {
          print('clique' + cont.toString());
          cont += 1;
          });
        },
      )),
    );
  }
}
*/