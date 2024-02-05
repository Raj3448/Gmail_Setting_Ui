import 'package:flutter/material.dart';

class SignatureProvider extends ChangeNotifier {
  List<String> _signatureList = [];

  List<String> get getSignatureList {
    return [..._signatureList];
  }

  void addSignature(String signature) {
    _signatureList.add(signature);
    notifyListeners();
  }

  void removeSignature(String signature) {
    _signatureList.removeWhere((element) => element == signature);
    notifyListeners();
  }
}
