import 'package:flutter/material.dart';
import 'package:teste/funcoes.dart';

class PagNovo extends StatefulWidget {
  const PagNovo({Key? key}) : super(key: key);

  @override
  State<PagNovo> createState() => EstadoPagNovo();
}

class EstadoPagNovo extends State<PagNovo> {
  aaa selecionado = aaa.ups;
  List listaEqp = ['ups', 'sdt', 'subp', 'ps'];
  String escolha = '';
  final valor = ValueNotifier('');
  String? value;
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.amberAccent,
      child: Column(children: [
        Container(
          height: 50,
        ),
        SizedBox(
          height: 80,
          child: foto(),
        ),
        campo('Nome', Icons.article),
        Container(
          height: 20,
        ),
        PopupMenuButton<aaa>(
          onSelected: (aaa resultado) {
            setState(() {
              selecionado = resultado;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<aaa>>[
            const PopupMenuItem(child: Text('data'), value: aaa.ps),
            const PopupMenuItem(child: Text('data'), value: aaa.sdt),
            const PopupMenuItem(child: Text('data'), value: aaa.subp),
            const PopupMenuItem(child: Text('data'), value: aaa.ps)
          ],
        ),
        campo('mttf', Icons.av_timer_outlined),
        Container(
          height: 7,
        ),
        campo('mttr', Icons.av_timer_outlined),
        Container(
          height: 7,
        ),
        campo('Potencia', Icons.bolt),
        Container(
          height: 7,
        ),
        campo('Eficiencia', Icons.percent_outlined),
        Container(
          height: 7,
        ),
        campo('Preço de Compra', Icons.monetization_on_outlined),
        Container(
          height: 7,
        ),
        campo('Exergia', Icons.power),
        Container(
          height: 7,
        ),
        SizedBox(
          width: 180,
          child: RawMaterialButton(
            fillColor: Colors.blueAccent,
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: () {},
            child: const Text(
              'Salvar',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          //color: Colors.amber,
        )
      ]),
    ));
  }
}

Widget foto() {
  return const Icon(
    Icons.settings_input_component_rounded,
    size: 65,
  );
}

enum aaa { ups, sdt, subp, ps }
