import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum MyTheme { dark, ligth }

class ThemeProvider with ChangeNotifier {
  static List<ThemeData> themes = [
    ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    ),
    ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    )
  ];

  MyTheme _myTheme = MyTheme.ligth;

  ThemeData _themeData = themes[0];

  get myTheme => _myTheme;

  get themeData => _themeData;

  void setTheme(MyTheme myTheme) {
    if (myTheme != null) {
      _myTheme = myTheme;
      _themeData = myTheme == MyTheme.ligth ? themes[0] : themes[1];

      notifyListeners();
    }
  }
}
