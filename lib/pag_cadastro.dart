import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'funcoes.dart';

class PagCadastro extends StatefulWidget {
  const PagCadastro({Key? key}) : super(key: key);

  @override
  State<PagCadastro> createState() => PagCadastroState();
}

class PagCadastroState extends State<PagCadastro> {
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 134, 234, 252),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 700,
                width: MediaQuery.of(context)
                    .size
                    .width, //MediaQuery.of(context) pega infos da tela
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      Container(
                        height: 40,
                      ),
                      TextField(
                        controller: nome,
                        onChanged: (texto) {
                          //usuario = texto;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: 'nome',
                            prefixIcon: Icon(
                              Icons.abc,
                              color: Color.fromARGB(255, 83, 186, 204),
                            ),
                            border: OutlineInputBorder()),
                      ),
                      Container(
                        height: 30,
                      ),
                      TextField(
                        controller: email,
                        onChanged: (texto) {},
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: 'e-mail',
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Color.fromARGB(255, 83, 186, 204),
                            ),
                            border: OutlineInputBorder()),
                      ),
                      Container(
                        height: 30,
                      ),
                      TextField(
                        controller: senha,
                        onChanged: (texto) {},
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'senha',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 83, 186, 204),
                            ),
                            border: OutlineInputBorder()),
                      ),
                      Container(
                        height: 50,
                      ),
                      SizedBox(
                        width: 180,
                        child: RawMaterialButton(
                          fillColor: const Color.fromARGB(255, 71, 165, 182),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          onPressed: () {
                            criarUsuario(
                                nome: nome.text,
                                email: email.text,
                                senha: senha.text);
                          },
                          child: const Text(
                            'cadastrar',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  Future criarUsuario(
      {required String nome,
      required String email,
      required String senha}) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email, //pega a variavel controle do email
            password: senha) //pega a variave controleer da senha
        .then((value) async {
      final id = FirebaseAuth.instance.currentUser?.uid;

      final docUser = FirebaseFirestore.instance.collection("usuarios").doc(id);
      final user =
          User1(id: docUser.id, nome: nome, email: email, senha: senha);
      final json = user.toJson();

      await docUser.set(json);
      Navigator.pop(context);
      chamarAviso(
          context, 'cadastro de usuario', 'usario cadastrado com sucesso');
    }).onError((error, stackTrace) {
      chamarAviso(context, 'Cadastro Falhou', error.toString());
    });
  }
}

class User1 {
  String id;
  String nome;
  String email;
  String senha;

  User1(
      {this.id = '',
      required this.nome,
      required this.email,
      required this.senha});

  Map<String, dynamic> toJson() =>
      {'id': id, 'nome': nome, 'email': email, 'senha': senha};

  static User1 fromJson(Map<String, dynamic> json) => User1(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      senha: json['senha']);
}
