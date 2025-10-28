// main.dart
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const AUPortalApp());
}

class AUPortalApp extends StatelessWidget {
  const AUPortalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AU Student Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
