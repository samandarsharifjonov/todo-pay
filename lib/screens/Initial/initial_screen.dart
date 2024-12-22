import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';
import '../splash_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  Future<bool> _isNameSaved() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('userName');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isNameSaved(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData && snapshot.data == true) {
          return const HomeScreen();
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}
