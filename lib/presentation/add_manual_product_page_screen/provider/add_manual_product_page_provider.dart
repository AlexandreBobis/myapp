import 'package:flutter/foundation.dart';

class AddManualProductPageProvider extends ChangeNotifier {
  // Variable d'état pour stocker le code-barres
  String _barcode = "";

  // Getter pour accéder au code-barres
  String get barcode => _barcode;

  // Setter pour modifier le code-barres
  void setBarcode(String newBarcode) {
    _barcode = newBarcode;
    notifyListeners(); // Informe les listeners de la modification de l'état
  }
}
