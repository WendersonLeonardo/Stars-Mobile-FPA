import 'package:flutter/material.dart';
import 'package:teste/pag_dados.dart';

Widget linha(context, String id, String texto1, String texto2, Color cor,
    Widget icone /*, String endereco*/) {
  return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
        child: ListTile(
          leading: icone,
          title: Text(
            texto1,
            style: const TextStyle(fontSize: 30),
          ),
          subtitle: Text(texto2, style: const TextStyle(fontSize: 20)),
          tileColor: cor,
        ),
      ),
      onTap: () {
        //Navigator.of(context).pushNamed('/inicial');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PagDados(id: id),
          ),
        );
        /*Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PagDados(
                  texto1: texto1,
                  texto2: texto2,
                  icone: icone,
                )))*/
      });
}

class FicaEscuro extends ChangeNotifier {
  static FicaEscuro noite = FicaEscuro();

  bool estahEscuro = false;

  escurecer() {
    //('b' + estahEscuro.toString());
    estahEscuro = !estahEscuro;
    (estahEscuro ? Brightness.dark : Brightness.light);
    notifyListeners();
  }
}
/*
class Alternador extends StatelessWidget {
  const Alternador({Key? key}) : super(key: key);

  //const Alternador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: Controlador.ctrl.ehDeNoite,
        onChanged: (value) {
          //value = false;
          Controlador.ctrl.changeTheme();
        });
  }
}*/

Widget campo(String texto, IconData icone) {
  return Container(
    width: 300,
    height: 55,
    alignment: Alignment.center,
    child: TextField(
      onChanged: (dado) {},
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: texto,
          prefixIcon: Icon(
            icone,
            color: Colors.grey,
            size: 35,
          ),
          border: const OutlineInputBorder()),
    ),
  );
}

Widget campoEntrada(String dica, IconData icone, TextEditingController ctrl,
    TextInputType tipo) {
  return Container(
    width: 300,
    height: 50,
    alignment: Alignment.center,
    child: TextField(
      controller: ctrl,
      onChanged: (dado) {},
      keyboardType: tipo,
      decoration: InputDecoration(
          hintText: dica,
          prefixIcon: Icon(
            icone,
            color: const Color.fromARGB(255, 138, 121, 61),
            size: 35,
          ),
          border: const OutlineInputBorder()),
    ),
  );
}

Widget campoEdissaum(String conteudo, String dica, IconData icone,
    TextEditingController ctrl, TextInputType tipo) {
  ctrl.text = conteudo;
  return Container(
    width: 300,
    height: 50,
    alignment: Alignment.center,
    child: TextField(
      controller: ctrl,
      onChanged: (dado) {},
      keyboardType: tipo,
      decoration: InputDecoration(
          labelText: dica,
          //hintText: dica,
          prefixIcon: Icon(
            icone,
            color: const Color.fromARGB(255, 97, 85, 204),
            size: 35,
          ),
          border: const OutlineInputBorder()),
    ),
  );
}

Widget botaum(context, String texto, Color cor, String rota) {
  return SizedBox(
    width: 180,
    child: RawMaterialButton(
      fillColor: cor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      onPressed: () {
        //Navigator.of(context).pushNamed(rota);
      },
      child: Text(
        texto,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
    //color: Colors.amber,
  );
}

void chamarAviso(BuildContext context, String titulo, String texto) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titulo,
            style: const TextStyle(fontSize: 20),
          ),
          content: Text(texto),
        );
      });
}

/*
Widget linha(context, String texto, Color cor) {
  return GestureDetector(
      child: Container(
          color: cor,
          width: 500,
          height: 70,
          child: Row(
            children: [
              SizedBox(
                //color: Colors.black,
                width: 50,
                height: 50,
                child: Image.asset('assets/images/icone1.jpg'),
              ),
              Text(
                texto,
                style: const TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          )),
      onTap: () {
        //Navigator.of(context).pushNamed('/inicial');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PagInicial(
                  texto: texto,
                )));
      });
}
*/
