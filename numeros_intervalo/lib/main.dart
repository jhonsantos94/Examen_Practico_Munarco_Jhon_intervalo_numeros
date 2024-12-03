import 'package:flutter/material.dart';
import 'ui/pagina_inicial.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegación y Números',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaginaInicial(),
    );
  }
}
