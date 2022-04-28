import 'package:flutter/material.dart';
import 'package:teste/pag_novo.dart';

import 'controlador.dart';
import 'funcoes.dart';

class PagScroll extends StatefulWidget {
  const PagScroll({Key? key}) : super(key: key);

  @override
  State<PagScroll> createState() => EstadoPagScroll();
}

class EstadoPagScroll extends State<PagScroll> {
  bool ativado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                  currentAccountPicture: SizedBox(
                    child: Icon(
                      Icons.person,
                      size: 70,
                    ),
                    width: 50,
                    height: 50,
                  ),
                  accountName: Text('www'),
                  accountEmail: Text('jklç')),
              const ListTile(
                leading: Icon(Icons.abc),
                title: Text('saaa'),
                subtitle: Text('ssdf'),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("titulo"),
          actions: [
            Switch(
                value: ativado, //Controlador.ctrl.eh_de_noite,
                onChanged: (value1) {
                  ativado = value1;
                  //Controlador.ctrl.changeTheme();
                })
          ],
          shadowColor: Colors.amber,
          //backgroundColor: Colors.greenAccent,
        ),
        body: ListView(
          children: [
            linha(context, 'texto1', 'texto2', Colors.greenAccent,
                const Icon(Icons.castle, size: 50)),
            linha(context, 'saaa', 'ssdf', Colors.redAccent,
                const Icon(Icons.face, size: 50)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add_circle_outline,
              size: 55,
            ),
            onPressed: () {
              //FicaEscuro.noite.escurecer();

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PagNovo()));
            }));
  }
}

class Alternador extends StatelessWidget {
  const Alternador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: Controlador.ctrl.eh_de_noite,
        onChanged: (value) {
          Controlador.ctrl.changeTheme();
        });
  }
}
