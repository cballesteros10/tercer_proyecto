import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

enum Operaciones{mas, menos}

class _MainAppState extends State<MainApp> {
  void miFuncion(Operaciones operacion) {
    setState(() {
      switch (operacion) {
        case Operaciones.mas:
          valorEstado++;
          break;
        case Operaciones.menos:
          valorEstado--;
          break;
      }
    });
  }

  int valorEstado = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Botones(laFuncion: miFuncion),
        body: Center(
          child: Text('$valorEstado', style: const TextStyle(fontSize: 40),),
        ),
      ),
    );
  }
}

class Botones extends StatelessWidget {
  const Botones({
    super.key, required this.laFuncion
  });

 final Function(Operaciones) laFuncion; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              laFuncion(Operaciones.menos);
            },
            child: const Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              laFuncion(Operaciones.mas);
            },
            child: const Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
