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
        width: MediaQuery.of(context).size.width, color: Colors.blueGrey[100],
        //MediaQuery.of(context) pega infos da tela
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                child: Image.asset('assets/images/logo.png'),
                //child: Image.network('https://th.bing.com/th/id/R.c661e1755aa70943884d902ef03b87b7?rik=c%2byonp3v9Wir4w&riu=http%3a%2f%2ffc03.deviantart.net%2ffs71%2ff%2f2013%2f292%2f6%2f7%2fshane_gang_logo_by_daisyshaneningham-d6r3ip9.jpg&ehk=WeWgi6r2FB5HmINSJuOk3HPPBf%2bBQiYyHckqPogYNk4%3d&risl=&pid=ImgRaw&r=0'),
              ),
              Container(
                height: 40,
              ),
              TextField(
                controller: email,
                onChanged: (texto) {},
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    //labelText: 'usuario',
                    hintText: 'e-mail',
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.grey,
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
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder()),
              ),
              Container(
                height: 30,
              ),
              SizedBox(
                width: 180,
                child: RawMaterialButton(
                  fillColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () async {
                    User? user = await loginUsingEmailPassword(
                        email: email.text,
                        password: senha.text,
                        context: context);

                    if (user != null) {
                      //if ((usuario == 'fdsa') && (senha == '123')) {
                      //print('valido');
                      //push empilha a proxima tela sobre a atual
                      //pushReplacement elimina a tela atual da pilha de telas
                      //Navigator.of(context).pushNamed('/lista');
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
