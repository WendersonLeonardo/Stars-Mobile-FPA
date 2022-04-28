import 'package:flutter/material.dart';
import 'package:teste/funcoes.dart';

class PagNovo extends StatefulWidget {
  const PagNovo({Key? key}) : super(key: key);

  @override
  State<PagNovo> createState() => EstadoPagNovo();
}

class EstadoPagNovo extends State<PagNovo> {
  //List<Map<String, dynamic>> selectedClasses = [];

  String dropdownvalue = 'ups';

  // List of items in our dropdown menu
  var listaEqp = ['ups', 'sdt', 'subp', 'ps'];

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
        DropdownButton(
          hint: Text('tipo'),
          // Initial Value
          value: dropdownvalue,

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          elevation: 16,
          style: const TextStyle(fontSize: 16, color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),

          // Array list of items
          items: listaEqp.map((String eqp) {
            return DropdownMenuItem(
              value: eqp,
              child: Text(eqp),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
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
