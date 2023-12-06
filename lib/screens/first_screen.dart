import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("O que é o MoneySplit?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 122, 86, 184),
                      Colors.white60,
                      Color.fromARGB(255, 122, 86, 184)
                    ]),
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.network(
                      "https://cdn-icons-png.flaticon.com/512/4862/4862695.png"),
                ),
                const Text(
                  "Bem-Vindo ao aplicativo que vai\ncolocar as suas finanças em ordem.\nNão importa se quer dividir suas contas\ncom amigos, colegas de trabalho, família.\nBasta criar uma conta ou entrar,\ncaso já seja cadastrado,\ne cuidar da sua vida financeira!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
