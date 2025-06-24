import 'package:flutter/material.dart';
import 'package:lectura_luz_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lectura Medidor de luz',
      
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Lectura Medidor de luz', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 136, 10, 1),
      ),
      body: MyHomePage(),
     );
  }
}

