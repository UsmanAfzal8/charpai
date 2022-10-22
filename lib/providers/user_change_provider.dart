import 'package:flutter/cupertino.dart';

class UserChangeProvider with ChangeNotifier {
  String _currentperson = '';
  String get currentperson => _currentperson;
  void currentper(String value) {
    print(value);
    _currentperson = value;
    notifyListeners();
  }
}
