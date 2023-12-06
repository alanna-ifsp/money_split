import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String username = "";
    String password = "";
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text("Insira seu email:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              TextFormField(
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
            ],
          ),
          Column(
            children: [
              const Text("Insira a sua senha:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              TextFormField(
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
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                // Lançando evento
                BlocProvider.of<AuthBloc>(context)
                    .add(LoginUser(username: username, password: password));
              }
            },
            child: const Text("Logar"),
          ),
        ],
      ),
    );
  }
}
