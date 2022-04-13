import 'package:flutter/cupertino.dart';

class Controlador extends ChangeNotifier {
  static Controlador ctrl = Controlador();
  bool eh_De_Noite1 = false;

  changeTheme() {
    eh_De_Noite1 = !eh_De_Noite1;
    notifyListeners();
  }
}
