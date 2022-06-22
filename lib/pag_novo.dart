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
        .then((value) => print(usuario.id))
        .catchError((error) => print('Falha ao adicionar tanque: $error'));
  }

  Stream<List<User1>> readUsers() => FirebaseFirestore.instance
      .collection('usuarios')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User1.fromJson(doc.data())).toList());

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
          color: Colors.amberAccent,
          child: Column(children: [
            Container(
              height: 50,
            ),
            SizedBox(
              height: 80,
              child: foto(),
            ),
            Container(
              height: 20,
            ),
            campo_entrada(
                'Nome do Equipamento', Icons.article, nome, TextInputType.name),
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
            campo_entrada(
                'mttf', Icons.av_timer_outlined, mttf, TextInputType.number),
            Container(
              height: 7,
            ),
            campo_entrada(
                'mttr', Icons.av_timer_outlined, mttr, TextInputType.number),
            Container(
              height: 7,
            ),
            campo_entrada('Potencia', Icons.bolt, pot, TextInputType.number),
            Container(
              height: 7,
            ),
            campo_entrada('Eficiencia', Icons.percent_outlined, eff,
                TextInputType.number),
            Container(
              height: 7,
            ),
            campo_entrada('Preço de Compra', Icons.monetization_on_outlined,
                preco, TextInputType.number),
            Container(
              height: 7,
            ),
            campo_entrada(
                'Exergia', Icons.power, exergia, TextInputType.number),
            Container(
              height: 15,
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.save,
              size: 45,
            ),
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

Widget foto() {
  return const Icon(
    Icons.settings_input_component_rounded,
    size: 65,
  );
}

class User1 {
  String id;
  String nome;

  User1({this.id = '', required this.nome});

  Map<String, dynamic> toJson() => {'id': id, 'nome': nome};

  static User1 fromJson(Map<String, dynamic> json) =>
      User1(id: json['id'], nome: json['nome']);
}
