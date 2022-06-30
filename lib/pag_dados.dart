import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'funcoes.dart';

class PagDados extends StatefulWidget {
  final String id;
  const PagDados({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EstadoPagDados();
  }
}

class EstadoPagDados extends State<PagDados> {
  int cont = 0;
  bool ehdenoite = false;

  EstadoPagDados();

  CollectionReference epqStream = FirebaseFirestore.instance
      .collection('usuarios')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('equipamentos');

  Future<void> atualizar() {
    return epqStream
        .doc(widget.id)
        .update({
          'nome': nome.text,
          'tipo': tipoEqp,
          'mttf': mttf.text,
          'mttr': mttr.text,
          'potencia': pot.text,
          'eficiencia': eff.text,
          'custo': preco.text,
          'exergia': exergia.text
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
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('usuarios')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('equipamentos')
            .doc(widget.id)
            .get(),
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            chamarAviso(context, '', 'Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            // print(widget.id);
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var data = snapshot.data!.data();
          var nome1 = data!['nome'];
          var tipo1 = data['tipo'];
          var mttf1 = data['mttf'];
          var mttr1 = data['mttr'];
          var pot1 = data['potencia'];
          var eff1 = data['eficiencia'];
          var preco1 = data['custo'];
          var exergia1 = data['exergia'];

          tipoEqp = tipo1;

          return Scaffold(
              body: Container(
                color: const Color.fromARGB(255, 191, 185, 243),
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
                  campoEdissaum(nome1, 'Nome do Equipamento', Icons.article,
                      nome, TextInputType.name),
                  Container(
                    height: 7,
                  ),
                  SizedBox(
                    width: 300,
                    height: 60,
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
                  campoEdissaum(mttf1, 'mttf', Icons.av_timer_outlined, mttf,
                      TextInputType.number),
                  Container(
                    height: 7,
                  ),
                  campoEdissaum(mttr1, 'mttr', Icons.av_timer_outlined, mttr,
                      TextInputType.number),
                  Container(
                    height: 7,
                  ),
                  campoEdissaum(
                      pot1, 'Potencia', Icons.bolt, pot, TextInputType.number),
                  Container(
                    height: 7,
                  ),
                  campoEdissaum(eff1, 'Eficiencia', Icons.percent_outlined, eff,
                      TextInputType.number),
                  Container(
                    height: 7,
                  ),
                  campoEdissaum(
                      preco1,
                      'Preço de Compra',
                      Icons.monetization_on_outlined,
                      preco,
                      TextInputType.number),
                  Container(
                    height: 7,
                  ),
                  campoEdissaum(exergia1, 'Exergia', Icons.power, exergia,
                      TextInputType.number),
                  Container(
                    height: 15,
                  )
                ]),
              ),
              floatingActionButton: FloatingActionButton(
                  child: const Icon(
                    Icons.save,
                    size: 45,
                    color: Color.fromARGB(255, 191, 185, 243),
                  ),
                  backgroundColor: const Color.fromARGB(255, 97, 85, 204),
                  onPressed: () {
                    atualizar();
                  }));
        });
  }
}
