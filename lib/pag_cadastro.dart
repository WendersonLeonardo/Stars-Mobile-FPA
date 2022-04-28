import 'package:flutter/material.dart';
import 'package:teste/controlador.dart';

class PagCadastro extends StatefulWidget {
  const PagCadastro({Key? key}) : super(key: key);

  @override
  State<PagCadastro> createState() => PagCadastroState();
}

class PagCadastroState extends State<PagCadastro> {
  String usuario = '';
  String senha = '';

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
          corpitcho(context, usuario, senha)
        ],
      ),
    );
  }
}

Widget corpitcho(context, usuario, senha) {
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
              //child: Image.network('https://th.bing.com/th/id/R.c661e1755aa70943884d902ef03b87b7?rik=c%2byonp3v9Wir4w&riu=http%3a%2f%2ffc03.deviantart.net%2ffs71%2ff%2f2013%2f292%2f6%2f7%2fshane_gang_logo_by_daisyshaneningham-d6r3ip9.jpg&ehk=WeWgi6r2FB5HmINSJuOk3HPPBf%2bBQiYyHckqPogYNk4%3d&risl=&pid=ImgRaw&r=0'),
            ),
            Container(
              height: 40,
            ),
            TextField(
              onChanged: (texto) {
                usuario = texto;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  //labelText: 'usuario',
                  hintText: 'nome',
                  prefixIcon: Icon(
                    Icons.abc,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder()),
            ),
            Container(
              height: 40,
            ),
            TextField(
              onChanged: (texto) {
                usuario = texto;
              },
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
              height: 40,
            ),
            TextField(
              onChanged: (texto) {
                usuario = texto;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  //labelText: 'usuario',
                  hintText: 'usuario',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder()),
            ),
            Container(
              height: 15,
            ),
            TextField(
              onChanged: (texto) {
                senha = texto;
              },
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
                onPressed: () {
                  //if ((usuario == 'abc') && (senha == '1234')) {
                  //print('valido');
                  //Navigator.of(context).pushNamed('/');
                  //Navigator.of(context).push(MaterialPageRoute(
                  //push empilha a proxima tela sobre a atual
                  //pushReplacement elimina a tela atual da pilha de telas
                  //builder: (context) => PagInicial()));
                  //} else {
                  //print('invalido');
                  //}
                },
                child: const Text(
                  'cadastrar',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              //color: Colors.amber,
            )
          ],
        ),
      ),
    ),
  );
}
