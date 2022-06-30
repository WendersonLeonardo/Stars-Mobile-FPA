import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teste/funcoes.dart';

class PagNovo extends StatefulWidget {
  const PagNovo({Key? key}) : super(key: key);

  @override
  State<PagNovo> createState() => EstadoPagNovo();
}

class EstadoPagNovo extends State<PagNovo> {
  DocumentReference<Map<String, dynamic>> usuario = FirebaseFirestore.instance
      .collection('usuarios')
      .doc(FirebaseAuth.instance.currentUser?.uid);

  Future<void> addEqp(
      {required nome,
      required tipo,
      required mttf,
      required mttr,
      required pot,
      required eff,
      required preco,
      required exergia}) {
    return usuario
        .collection('equipamentos')
        .add({
          'nome': nome,
          'tipo': tipo,
          'mttf': mttf,
          'mttr': mttr,
          'potencia': pot,
          'eficiencia': eff,
          'custo': preco,
          'exergia': exergia
        })
        .then((value) => Navigator.pop(context))
        .catchError((error) => chamarAviso(
            context, 'Falha ao cadastrar equipamento', error.toString()));
  }

  TextEditingController nome = TextEditingController();
  var tipoEqp = null;
  TextEditingController mttf = TextEditingController();
  TextEditingController mttr = TextEditingController();
  TextEditingController pot = TextEditingController();
  TextEditingController eff = TextEditingController();
  TextEditingController preco = TextEditingController();
  TextEditingController exergia = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 231, 206, 116),
          child: Column(children: [
            Container(
              height: 50,
            ),
            const SizedBox(
              height: 80,
              child: Icon(
                Icons.settings_input_component_rounded,
                size: 65,
              ),
            ),
            Container(
              height: 20,
            ),
            campoEntrada(
                'Nome do Equipamento', Icons.article, nome, TextInputType.name),
            Container(
              height: 7,
            ),
            SizedBox(
              width: 300,
              height: 60,
              //padding: EdgeInsets.only(left: 5, right: 5),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Tipo de Equipamento",
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    tipoEqp = newValue!;
                  });
                },
                items: <String>['ups', 'sdt', 'subp', 'ps']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              height: 7,
            ),
            campoEntrada(
                'mttf', Icons.av_timer_outlined, mttf, TextInputType.number),
            Container(
              height: 7,
            ),
            campoEntrada(
                'mttr', Icons.av_timer_outlined, mttr, TextInputType.number),
            Container(
              height: 7,
            ),
            campoEntrada('Potencia', Icons.bolt, pot, TextInputType.number),
            Container(
              height: 7,
            ),
            campoEntrada('Eficiencia', Icons.percent_outlined, eff,
                TextInputType.number),
            Container(
              height: 7,
            ),
            campoEntrada('Preço de Compra', Icons.monetization_on_outlined,
                preco, TextInputType.number),
            Container(
              height: 7,
            ),
            campoEntrada(
              'Exergia',
              Icons.power,
              exergia,
              TextInputType.number,
            ),
            Container(
              height: 15,
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.save,
              size: 45,
              color: Color.fromARGB(255, 231, 206, 116),
            ),
            backgroundColor: const Color.fromARGB(255, 138, 121, 61),
            onPressed: () {
              addEqp(
                  nome: nome.text,
                  tipo: tipoEqp,
                  mttf: mttf.text,
                  mttr: mttr.text,
                  pot: pot.text,
                  eff: eff.text,
                  preco: preco.text,
                  exergia: exergia.text);
            }));
  }
}
