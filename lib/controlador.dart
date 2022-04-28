import 'package:flutter/cupertino.dart';

class Controlador extends ChangeNotifier {
  static Controlador ctrl = Controlador();
  bool ehDeNoite = false;

  changeTheme() {
    ehDeNoite = !ehDeNoite;
    notifyListeners();
  }
}
