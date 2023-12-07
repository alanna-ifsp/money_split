import 'package:atividade03_teste/model/users.dart';
import 'package:flutter/material.dart';

var items = [];

class HistoricScreen extends StatelessWidget {
  const HistoricScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    items.clear();
    for (var i = 0; i < 2; i++) {
      items.add("$i");
    }
    return SizedBox.expand(
      child: Column(
        children: [
          const Text("Seu Histórico",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.black, width: 3))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        const Column(
                          children: [
                            Text("Churras de Limeira",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold)),
                            Text("Carne do Enxuto",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const Column(
                          children: [
                            Text("Pagador: Pessoa01",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                            Text("Recebedor: Pessoa02",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text(items[index] + "0,00",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
