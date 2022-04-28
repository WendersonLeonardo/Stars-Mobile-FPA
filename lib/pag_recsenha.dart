import 'package:flutter/material.dart';
import 'package:teste/funcoes.dart';

class PagRecSenha extends StatefulWidget {
  const PagRecSenha({Key? key}) : super(key: key);

  @override
  State<PagRecSenha> createState() => PagRecSenhaState();
}

class PagRecSenhaState extends State<PagRecSenha> {
  String usuario = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.blueGrey[100],
            /*child: Image.asset(
                'assets/images/back.jpg',
                fit: BoxFit.cover,
              )*/
          ),
          //Container(color: Colors.amberAccent,),
          corpitcho(context, usuario)
        ],
      ),
    );
  }
}

Widget corpitcho(context, usuario) {
  return SingleChildScrollView(
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
            const Text(
              'Informe seu e-mail',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            TextField(
              onChanged: (texto) {
                usuario = texto;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  //labelText: 'e-mail',
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
            Container(
              height: 30,
            ),
            botaum(context, 'solicitar', Colors.redAccent, ''),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}
