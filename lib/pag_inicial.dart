import 'package:flutter/material.dart';
import 'package:teste/controlador.dart';

class PagInicial extends StatefulWidget {
  final String texto;
  const PagInicial({Key? key, required this.texto}) : super(key: key);
  //const PagInicial({Key? key, required this.texto}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return EstadoPagInicial(texto: texto);
  }
}

class EstadoPagInicial extends State<PagInicial> {
  int cont = 0;
  bool ehDeNoite = false;

  String texto;
  EstadoPagInicial({required this.texto});

  //String texto;
  //const EstadoPagInicial({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("inicial"), actions: const [Alternador()],
        shadowColor: Colors.amber,
        //backgroundColor: Colors.greenAccent,
      ),
      body: SizedBox(
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'uawei $cont',
                  style:
                      const TextStyle(color: Colors.blueAccent, fontSize: 38.0),
                ),
                Container(
                  height: 10,
                  //color: Colors.amber,
                ),
                Text(
                  texto,
                  style: const TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 38.0,
                    //background: Paint()
                  ),
                ),
                Container(
                  height: 10,
                  //color: Colors.amber,
                ),
                const Text(
                  'texto3',
                  style: TextStyle(color: Colors.redAccent, fontSize: 38.0),
                ),
                Container(
                  height: 10,
                  //color: Colors.amber,
                ),
              ],
            ),
          ],
        ),
      ),
      //Align(alignment: Alignment.topRight, child: Alternador()),

      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.woman_outlined),
          onPressed: () {
            setState(() {
              //print('clique' + cont.toString());
              cont += 1;
            });
          }),
    );
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
