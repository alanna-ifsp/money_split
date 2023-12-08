import 'package:atividade03_teste/model/movements.dart';
import 'package:atividade03_teste/model/user_model.dart';
import 'package:atividade03_teste/model/users.dart';
import 'package:atividade03_teste/screens/friends_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:atividade03_teste/provider/rest_provider_user.dart';
import 'package:atividade03_teste/provider/firebase_auth.dart';
import 'package:atividade03_teste/model/movements_model.dart';

var items = [];

class HistoricScreen extends StatefulWidget {
  const HistoricScreen({Key? key}) : super(key: key);

  @override
  State<HistoricScreen> createState() => _HistoricScreenState();
}

class _HistoricScreenState extends State<HistoricScreen> {
  UserModel? authenticatedUser;

  @override
  void initState() {
    super.initState();
    getCurrentUserHistoric();
  }

  Future<void> getCurrentUserHistoric() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final currentEmail = user?.email;

    RestDataProvider restDataProvider = RestDataProvider.helper;
    UserCollection allUsers = UserCollection();
    allUsers = await restDataProvider.getUsersList();
    for (int i = 0; i < allUsers.length(); i++) {
      UserModel user = allUsers.getUserAtIndex(i);
      if (currentEmail == user.getEmail) {
        setState(() {
          authenticatedUser = user;
        });
      }
    }
    MovimentCollection allUserMovements = MovimentCollection();
    allUserMovements = await restDataProvider.getMovimentList();
    items.clear();
    for (int i = 0; i < allUserMovements.length(); i++) {
      MovimentModel movement = allUserMovements.getMovimentAtIndex(i);
      if (movement.nomeDevedor == authenticatedUser?.getEmail) {
        items.add([
          "https://cdn-icons-png.flaticon.com/512/7737/7737848.png",
          movement.descricao,
          movement.getNomePagador,
          movement.getNomeDevedor,
          movement.getValor
        ]);
      }
      if (movement.nomePagador == authenticatedUser?.getEmail) {
        items.add([
          "https://cdn-icons-png.flaticon.com/512/5997/5997669.png",
          movement.descricao,
          movement.getNomePagador,
          movement.getNomeDevedor,
          movement.getValor
        ]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/fundo.png"), fit: BoxFit.cover)),
      child: Column(
        children: [
          Text("Histórico de ${authenticatedUser?.getName}",
              style: const TextStyle(
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
                              bottom:
                                  BorderSide(color: Colors.black, width: 3))),
                      child: Row(children: [
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
                          child: Image.network(items[index][0]),
                        ),
                        Column(children: [
                          Row(children: [
                            Text(items[index][1],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                            Text(items[index][2],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                            Text(items[index][3],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                            Text((items[index][4]).toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold)),
                          ]),
                        ])
                      ]));
                }),
          ),
        ],
      ),
    ));
  }
}
