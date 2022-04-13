import 'package:flutter/material.dart';
import 'package:teste/pag_dados.dart';

import 'controlador.dart';

Widget linha(context, String texto1, String texto2, Color cor, Widget icone) {
  return GestureDetector(
      child: ListTile(
        leading: icone,
        title: Text(
          texto1,
          style: const TextStyle(fontSize: 30),
        ),
        subtitle: Text(texto2, style: const TextStyle(fontSize: 20)),
        tileColor: cor,
      ),
      onTap: () {
        //Navigator.of(context).pushNamed('/inicial');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PagDados(
                  texto1: texto1,
                  texto2: texto2,
                  icone: icone,
                )));
      });
}

class Alternador extends StatelessWidget {
  const Alternador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: Controlador.ctrl.eh_De_Noite1,
        onChanged: (value) {
          Controlador.ctrl.changeTheme();
        });
  }
}

/*
Widget linha(context, String texto, Color cor) {
  return GestureDetector(
      child: Container(
          color: cor,
          width: 500,
          height: 70,
          child: Row(
            children: [
              SizedBox(
                //color: Colors.black,
                width: 50,
                height: 50,
                child: Image.asset('assets/images/icone1.jpg'),
              ),
              Text(
                texto,
                style: const TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          )),
      onTap: () {
        //Navigator.of(context).pushNamed('/inicial');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PagInicial(
                  texto: texto,
                )));
      });
}
*/
