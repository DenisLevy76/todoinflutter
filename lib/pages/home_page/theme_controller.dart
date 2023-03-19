import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  static ThemeController instance = ThemeController();
  bool isDarkThemeSelected = false;

  toggleTheme() {
    isDarkThemeSelected = !isDarkThemeSelected;
    notifyListeners();
  }
}
