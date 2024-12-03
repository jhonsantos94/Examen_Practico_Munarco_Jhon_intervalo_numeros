import 'package:flutter/material.dart';
import 'pagina_ingreso.dart';

class PaginaInicial extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  final TextEditingController _nombreController = TextEditingController();

  void _guardarNombre() {
    if (_nombreController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaginaIngreso(nombre: _nombreController.text),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Por favor ingrese su nombre.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 252, 251, 252),
              Colors.deepPurple.shade700
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Ejercicio: Números Intermedios',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              Icon(
                Icons.calculate_outlined,
                size: 100.0,
                color: Colors.white,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Ingrese su nombre',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _guardarNombre,
                child: Text('Continuar'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  backgroundColor: Colors.deepPurple.shade600,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Bienvenido al ejercicio. ¡Vamos a comenzar!',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
