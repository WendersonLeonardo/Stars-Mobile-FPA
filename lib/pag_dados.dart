import 'package:flutter/material.dart';

import 'funcoes.dart';

class PagDados extends StatefulWidget {
  final String texto1;
  final String texto2;
  final Widget icone;
  const PagDados(
      {Key? key,
      required this.texto1,
      required this.texto2,
      required this.icone})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EstadoPagDados(texto1: texto1, texto2: texto2, icone: icone);
  }
}

class EstadoPagDados extends State<PagDados> {
  int cont = 0;
  bool eh_de_noite = false;

  String texto1;
  final String texto2;
  final Widget icone;
  EstadoPagDados(
      {required this.texto1, required this.texto2, required this.icone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("lista"),
        shadowColor: Colors.amber,
        //backgroundColor: Colors.greenAccent,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 30,
              //color: Colors.amber,
            ),
            SizedBox(
              //color: Colors.black45,
              height: 150,
              width: 200,
              child: Image.asset(
                'assets/images/icone1.jpg',
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  //color: Colors.amber,
                ),
                Container(
                  height: 50,
                  //color: Colors.amber,
                ),
                Text(
                  texto1,
                  style: const TextStyle(
                    //color: Colors.amberAccent,
                    fontSize: 38.0,
                    //background: Paint()
                  ),
                ),
                Container(
                  height: 10,
                  //color: Colors.amber,
                ),
                Text(
                  texto2,
                  style: const TextStyle(
                      /*color: Colors.redAccent,*/ fontSize: 38.0),
                ),
                Container(
                  height: 40,
                  //color: Colors.amber,
                ),
              ],
            ),
            SizedBox(
              width: 180,
              child: RawMaterialButton(
                fillColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {},
                child: const Text(
                  'editar',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              //color: Colors.amber,
            ),
          ],
        ),
      ),
      //Align(alignment: Alignment.topRight, child: Alternador()),
    );
  }
}
/*

*/