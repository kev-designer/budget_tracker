import 'package:flutter/material.dart';

class ThemeService with ChangeNotifier {
  bool _darkTheme = true;

  //GETTER
  bool get darkTheme => _darkTheme;

  //SETTER
  set darkTheme(bool value) {
    _darkTheme = value;
    notifyListeners();
  }
}
