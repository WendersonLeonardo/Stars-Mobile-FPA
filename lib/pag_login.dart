import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teste/pag_scroll.dart';

import 'funcoes.dart';
import 'pag_cadastro.dart';

class PagLogin extends StatefulWidget {
  const PagLogin({Key? key}) : super(key: key);

  @override
  State<PagLogin> createState() => PagLoginState();
}

class PagLoginState extends State<PagLogin> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        chamarAviso(context, 'login falhou', 'usuario não encontrado');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController senha = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 209, 234, 247),
        //MediaQuery.of(context) pega infos da tela
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 240,
                child: Image.asset('assets/images/logo.png'),
              ),
              Container(
                height: 20,
              ),
              TextField(
                controller: email,
                onChanged: (texto) {},
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'e-mail',
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color.fromARGB(255, 143, 164, 173),
                    ),
                    border: OutlineInputBorder()),
              ),
              Container(
                height: 15,
              ),
              TextField(
                controller: senha,
                onChanged: (texto) {},
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'senha',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 143, 164, 173),
                    ),
                    border: OutlineInputBorder()),
              ),
              Container(
                height: 30,
              ),
              SizedBox(
                width: 180,
                child: RawMaterialButton(
                  fillColor: const Color.fromARGB(255, 143, 164, 173),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () async {
                    User? user = await loginUsingEmailPassword(
                        email: email.text,
                        password: senha.text,
                        context: context);

                    if (user != null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PagScroll()));
                    } else {
                      chamarAviso(context, 'login falhou',
                          'usuario e/ou senha invalidos');
                    }
                  },
                  child: const Text(
                    'login',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: const Text(
                  'cadastrar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PagCadastro()));
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
