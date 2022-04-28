import 'package:flutter/material.dart';

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
            Text(
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
            SizedBox(
              width: 180,
              child: RawMaterialButton(
                fillColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  //Navigator.of(context).pushNamed('/lista');
                },
                child: const Text(
                  'solicitar',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              //color: Colors.amber,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}
