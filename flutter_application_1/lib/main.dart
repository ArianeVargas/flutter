import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hola Mundo Adso",
      color: Color.fromARGB(255, 242, 45, 5),
      home: Distribucion(),
    );
  }
}

class Distribucion extends StatelessWidget {
  const Distribucion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        children: [
          Container(
            color: Colors.yellow,
            width: 100,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  width: double.infinity,
                  color: const Color.fromRGBO(33, 150, 243, 1),
                  child: const Center(
                      child: Text(
                    "1",
                    style: TextStyle(
                        decoration: TextDecoration.none, color: Colors.white),
                  )),
                )),
                Expanded(
                    child: Container(
                  color: Colors.white,
                )),
                Expanded(
                    child: Container(
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                        "assets/face.png",
                        width: 80,
                        height: 80,
                      )),
                      ClipRRect(
                         borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/tw.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                      ClipRRect(
                         borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/wp.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  color: Colors.green,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}