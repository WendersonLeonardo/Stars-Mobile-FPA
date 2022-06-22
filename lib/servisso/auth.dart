import 'package:firebase_auth/firebase_auth.dart';

class AuthServ {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future loginAnom() async {
    try {
      UserCredential resultado = await _auth.signInAnonymously();

      User? usuario = resultado.user;
      return usuario;
    } catch (erro) {
      print(erro.toString());
      return null;
    }
  }
}
