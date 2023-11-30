import 'package:flutter/material.dart';

void main() {
  runApp(const Inicio());
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tarjetas'),
        ),
        body: Column(
          children: [
            MyCard(
              cardColor: const Color.fromARGB(255, 254, 172, 64),
              iconColor: const Color.fromARGB(255, 140, 96, 35), 
              textColor: Colors.white,
              icon: Icons.photo_album,
              title: 'Photo Album',
              description: 'TWICE',
              editarLabel: 'Editar',
              crearLabel: 'Crear',
              eliminarLabel: 'Eliminar',
              onEditarPressed: () {
              },
              onCrearPressed: () {
              },
              onEliminarPressed: () {
              },
            ),
            MyCard(
              cardColor: const Color.fromARGB(255, 139, 195, 72),
              iconColor: const Color.fromARGB(255, 80, 109, 45), 
              textColor: Colors.white,
              icon: Icons.access_time,
              title: 'Time',
              description: 'TWICE',
              editarLabel: 'Editar',
              crearLabel: 'Crear',
              eliminarLabel: 'Eliminar',
              onEditarPressed: () {
              },
              onCrearPressed: () {
              },
              onEliminarPressed: () {
              },
            ),
            MyCard(
              cardColor: const Color.fromARGB(255, 254, 64, 128),
              iconColor: const Color.fromARGB(255, 141, 35, 71), 
              textColor: Colors.white,
              icon: Icons.accessibility,
              title: 'Access',
              description: 'TEWICE',
              editarLabel: 'Editar',
              crearLabel: 'Crear',
              eliminarLabel: 'Eliminar',
              onEditarPressed: () {
              },
              onCrearPressed: () {
              },
              onEliminarPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.cardColor,
    required this.iconColor,
    required this.textColor,
    required this.icon,
    required this.title,
    required this.description,
    required this.editarLabel,
    required this.crearLabel,
    required this.eliminarLabel,
    required this.onEditarPressed,
    required this.onCrearPressed,
    required this.onEliminarPressed,
  }) : super(key: key);

  final Color cardColor;
  final Color iconColor;
  final Color textColor;
  final IconData icon;
  final String title;
  final String description;
  final String editarLabel;
  final String crearLabel;
  final String eliminarLabel;
  final VoidCallback onEditarPressed;
  final VoidCallback onCrearPressed;
  final VoidCallback onEliminarPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      margin: const EdgeInsets.all(16.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), 
      ),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 75.0,
                    color: iconColor,
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(fontSize: 20.0, color: textColor),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: onEditarPressed,
                    child: Text(
                      editarLabel,
                      style: TextStyle(fontSize: 15.0, color: textColor),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  TextButton(
                    onPressed: onCrearPressed,
                    child: Text(
                      crearLabel,
                      style: TextStyle(fontSize: 15.0, color: textColor),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  TextButton(
                    onPressed: onEliminarPressed,
                    child: Text(
                      eliminarLabel,
                      style: TextStyle(fontSize: 15.0, color: textColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
