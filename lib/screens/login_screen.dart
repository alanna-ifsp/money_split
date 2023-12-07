import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    FocusNode myFocusNode = FocusNode();
    String username = "";
    String password = "";

    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/fundo.png"),
        fit: BoxFit.cover,
      )),
      child: ListView(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Form(
            key: formkey,
            child: Column(
              children: [
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          labelText: 'Email',
                          hintText: 'Digite seu e-mail',
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(
                              backgroundColor: myFocusNode.hasFocus
                                  ? Colors.white
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              color: myFocusNode.hasFocus
                                  ? Colors.white
                                  : Colors.black),
                          errorStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.red)),
                      validator: (String? inValue) {
                        if (inValue!.isEmpty) {
                          return "Insira seu email";
                        }
                        return null;
                      },
                      onSaved: (String? inValue) {
                        username = inValue!;
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
                Column(
                  children: [
                    TextFormField(
                      obscureText: true,
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
                          labelText: 'Senha',
                          hintText: 'Digite sua senha',
                          filled: true,
                          fillColor: Colors.white,
                          errorStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.red)),
                      validator: (String? inValue) {
                        if (inValue!.length < 4) {
                          return "Tem que ter ao menos 4 caracters";
                        }
                        return null;
                      },
                      onSaved: (String? inValue) {
                        password = inValue!;
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      // Lançando evento
                      BlocProvider.of<AuthBloc>(context).add(
                          LoginUser(username: username, password: password));
                    }
                  },
                  child: const Text("Entrar",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
