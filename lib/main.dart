// Danilo Almeida Brito
import 'package:flutter/material.dart';

void main() => runApp(const Principal());

class Principal extends StatelessWidget {
  const Principal({super.key});

  static const String nomeAluno = 'Danilo Almeida Brito';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        body: _corpo(),
      ),
    );
  }

  AppBar _titulo() {
    return AppBar(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Pontos Turísticos', style: TextStyle(fontSize: 20)),
          Text(nomeAluno, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Container _corpo() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: const Text('Catálogo de Pontos Turísticos da Baixada Santista'),
    );
  }
}
