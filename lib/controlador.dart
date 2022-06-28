import 'package:flutter/cupertino.dart';

class Controlador extends ChangeNotifier {
  static Controlador ctrl = Controlador();
  bool ehDeNoite1 = false;

  changeTheme() {
    ehDeNoite1 = !ehDeNoite1;
    notifyListeners();
  }
}
