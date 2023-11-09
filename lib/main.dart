import 'package:flutter/material.dart';
import 'package:target_sistemas/page/tela_login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Target Sistemas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const TelaLogin(),
    );
  }
}
