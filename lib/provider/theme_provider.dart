import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';


class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ThemeProvider() {
    _loadThemeFromPreferences();
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    await _saveThemeToPreferences();
  }

  Future<void> _saveThemeToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  Future<void> _loadThemeFromPreferences() async {
    try{
      final prefs = await SharedPreferences.getInstance();
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
      notifyListeners();
    }catch(error){
      debugPrint("----_loadThemeFromPreferences--------------ERROR -----------------ERROR -------> $error");
    }
  }

  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blueAccent,
      fontFamily: "Poppins",
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color.fromRGBO(28, 28, 30, 1),
      primaryColor: Colors.tealAccent,
      fontFamily: "Poppins",
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }


  Future<void> themeOff()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _isDarkMode = false;
    notifyListeners();
  }


}
