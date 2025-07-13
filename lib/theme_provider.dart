import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {

  bool _isDarkmode = false;

  ThemeProvider(){
    _loadThemes();
  }

  bool getThemeValue() => _isDarkmode;

  void updateTheme({required bool value}){
    _isDarkmode = value;
   _saveTheme(value);
    notifyListeners();
  }

  Future<void> _loadThemes()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    _isDarkmode = pref.getBool('isdark') ?? false;
    notifyListeners();
  }

  Future<void> _saveTheme(bool value)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('isdark', value);
  }

}