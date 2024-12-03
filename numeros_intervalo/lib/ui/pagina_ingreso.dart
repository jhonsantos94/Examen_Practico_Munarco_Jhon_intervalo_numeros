import 'package:flutter/material.dart';
import 'dart:io';
import '../logica/numeros.dart';

class PaginaIngreso extends StatefulWidget {
  final String nombre;

  PaginaIngreso({required this.nombre});

  @override
  State<StatefulWidget> createState() => _PaginaIngresoState();
}

class _PaginaIngresoState extends State<PaginaIngreso> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  String _resultado = '';
  final Numeros _numeros = Numeros();

  void _calcularNumeros() {
    final num1 = int.tryParse(_num1Controller.text);
    final num2 = int.tryParse(_num2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        _resultado = 'Por favor ingrese números válidos y enteros.';
      });
    } else {
      final resultadoNumeros = _numeros.mostrarNumerosEntre(num1, num2);
      setState(() {
        _resultado = resultadoNumeros;
      });
    }
  }

  void _salir() {
    exit(0); // Cierra la aplicación
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 246, 247, 247),
              Colors.teal.shade900
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Hola, ${widget.nombre}!',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Icon(
                Icons.format_list_numbered_outlined,
                size: 100.0,
                color: Colors.white,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _num1Controller,
                decoration: InputDecoration(
                  labelText: 'Número 1',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _num2Controller,
                decoration: InputDecoration(
                  labelText: 'Número 2',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _calcularNumeros,
                child: Text('Calcular'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  backgroundColor: Colors.teal.shade800,
                ),
              ),
              SizedBox(height: 20.0),
              if (_resultado.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.tealAccent),
                  ),
                  child: Text(
                    _resultado,
                    style:
                        TextStyle(fontSize: 18.0, color: Colors.teal.shade800),
                    textAlign: TextAlign.center,
                  ),
                ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _salir,
                child: Text('Salir'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  backgroundColor: Colors.red.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
