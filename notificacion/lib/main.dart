import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Vendedor {
  final String nombre;
  final String apellido;
  final String cedula;
  final String telefono;
  final String usuario;
  final String titulo;
  final String descripcion;

  Vendedor({
    required this.nombre,
    required this.apellido,
    required this.cedula,
    required this.telefono,
    required this.usuario,
    required this.titulo,
    required this.descripcion,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 209, 238, 175), // Color de fondo de la aplicación
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tarjeta con Flutter'),
        ),
        body: const MyCard(),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          margin: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.home,
                        size: 30.0,
                        color: Colors.black,
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Título de la Tarjeta',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Descripción de la tarjeta...',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Lógica para el botón Aceptar
                        },
                        child: const Text('Aceptar'),
                      ),
                      const SizedBox(width: 8.0),
                      TextButton(
                        onPressed: () {
                          // Lógica para el botón Cancelar
                        },
                        child: const Text('Cancelar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
