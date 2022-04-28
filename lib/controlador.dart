import 'package:flutter/cupertino.dart';

class Controlador extends ChangeNotifier {
  static Controlador ctrl = Controlador();
  bool eh_de_noite = false;

  changeTheme() {
    eh_de_noite = !eh_de_noite;
    notifyListeners();
  }
}
