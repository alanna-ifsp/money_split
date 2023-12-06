import 'package:flutter/material.dart';

class HistoricScreen extends StatelessWidget {
  const HistoricScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          const Text("Seu Histórico",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 122, 86, 184),
                    Colors.white70,
                    Color.fromARGB(255, 122, 86, 184)
                  ]),
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/1019/1019607.png"),
              ),
              const Text("Recebeu pela Pizza",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 122, 86, 184),
                    Colors.white70,
                    Color.fromARGB(255, 122, 86, 184)
                  ]),
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/625/625599.png"),
              ),
              const Text("Pagou pelo Energia de Luz",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 122, 86, 184),
                    Colors.white70,
                    Color.fromARGB(255, 122, 86, 184)
                  ]),
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/1019/1019607.png"),
              ),
              const Text("Recebeu pelo Spotify",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
