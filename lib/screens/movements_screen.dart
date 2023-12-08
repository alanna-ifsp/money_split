import 'package:atividade03_teste/bloc/manage_provider.dart';
import 'package:atividade03_teste/model/movements_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atividade03_teste/provider/rest_provider_user.dart';
import 'package:atividade03_teste/model/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:atividade03_teste/model/user_model.dart';

class MovimentScreen extends StatefulWidget {
  const MovimentScreen({Key? key}) : super(key: key);

  @override
  State<MovimentScreen> createState() => _MovimentScreenState();
}

class _MovimentScreenState extends State<MovimentScreen> {
  UserModel? authenticatedUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
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
  }

  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    MovimentModel moviment = MovimentModel();
    FocusNode myFocusNode = FocusNode();

    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fundo.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(children: [
              Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  backgroundColor: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              labelText: 'Amigo',
                              hintText:
                                  'Digite o email do amigo com quem você vai dividir a conta',
                              filled: true,
                              fillColor: Colors.white,
                              errorStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.red)),
                          validator: (String? inValue) {
                            if (inValue!.length < 1) {
                              return "Tem que ter ao menos 2 caracters";
                            }
                            return null;
                          },
                          onSaved: (String? inValue) {
                            moviment.setNomeDevedor = inValue!;
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                    Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  backgroundColor: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              labelText: 'Valor',
                              hintText: 'Digite o valor da conta',
                              filled: true,
                              fillColor: Colors.white,
                              errorStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.red)),
                          validator: (String? inValue) {
                            if (int.parse(inValue!) < 0) {
                              return "O valor não pode ser negativo";
                            }
                            return null;
                          },
                          onSaved: (String? inValue) {
                            moviment.setValor = int.parse(inValue!);
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                    Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  backgroundColor: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  color: myFocusNode.hasFocus
                                      ? Colors.white
                                      : Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              labelText: 'Descrição',
                              hintText: 'Insira qual foi a compra',
                              filled: true,
                              fillColor: Colors.white,
                              errorStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.red)),
                          onSaved: (String? inValue) {
                            moviment.setDescricao = inValue!;
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                    ElevatedButton(
                        child: const Text("Cadastrar"),
                        onPressed: () {
                          moviment.nomePagador = authenticatedUser?.getEmail;
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            // Lançando evento
                            BlocProvider.of<ManageBloc>(context)
                                .add(SubmitEventMoviment(moviment: moviment));
                          }
                        })
                  ],
                ),
              )
            ])));
  }
}
