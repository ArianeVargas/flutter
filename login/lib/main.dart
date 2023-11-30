import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'inicio.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 201, 28, 135),
                Color.fromARGB(255, 112, 18, 129),
                Color.fromARGB(255, 41, 147, 233)
              ],
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (kDebugMode) {
      print('Username/Email: $username');
    }
    if (kDebugMode) {
      print('Password: $password');
    }

    final response = await http.post(
      Uri.parse('https://transporte-el2a.onrender.com/api/vendedor/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'usuario': username,
        'contrasena': password,
      }),
    );

    if (response.statusCode == 200) {
      // Si la solicitud es exitosa, puedes manejar la respuesta aquí
      if (kDebugMode) {
        print('Login exitoso: ${response.body}');
      }
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Inicio()),  // Reemplace la pantalla actual con la pantalla de inicio
    );
    } else {
      // Si la solicitud no es exitosa, puedes manejar el error aquí
      if (kDebugMode) {
        print('Error en el login: ${response.statusCode}');
      }
      // Puedes mostrar un mensaje de error al usuario si lo deseas
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage('assets/user.jpg'),
        ),
        const SizedBox(height: 40.0),
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: 'Usuario',
            prefixIcon: const Icon(Icons.person),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Contraseña',
            prefixIcon: const Icon(Icons.lock),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        const SizedBox(height: 35.0),
        ElevatedButton(
          onPressed: _login,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.login),
              SizedBox(width: 10.0),
              Text(
                'Ingresar',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        TextButton(
          onPressed: () {
            if (kDebugMode) {
              print('¿No tienes cuenta? Regístrate');
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Register()),
            );
          },
          child: const Text(
            '¿No tienes cuenta? Regístrate',
            style: TextStyle(
              color: Color.fromRGBO(237, 239, 241, 1),
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
