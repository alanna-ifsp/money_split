import 'package:atividade03_teste/bloc/manage_provider.dart';
import 'package:atividade03_teste/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String username = "";
    String password = "";
    UserModel user = UserModel();

    FocusNode myFocusNode = FocusNode();

return  Scaffold(
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
                              labelText: 'Nome',
                              hintText: 'Digite o seu nome',
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
                            user.setName = inValue!;
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
                              labelText: 'Idade',
                              hintText: 'Digite sua idade',
                              filled: true,
                              fillColor: Colors.white,
                              errorStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.red)),
                          validator: (String? inValue) {
                            if (int.parse(inValue!) < 12) {
                              return "Você precisa ser maior que 12 anos para acessar a plataforma";
                            }
                            return null;
                          },
                          onSaved: (String? inValue) {
                            user.setAge = int.parse(inValue!);
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
                              labelText: 'Chave Pix',
                              hintText: 'Insira a sua principal chave PIX',
                              filled: true,
                              fillColor: Colors.white,
                              errorStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.red)),
                          onSaved: (String? inValue) {
                            user.setPix = inValue!;
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
                              labelText: 'Celular',
                              hintText: 'Digite seu celular',
                              filled: true,
                              fillColor: Colors.white,
                              errorStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.red)),
                          validator: (String? inValue) {
                            if (inValue!.length < 9) {
                              return "O celular precisa ter ao menos 9 caracteres";
                            }
                            return null;
                          },
                          onSaved: (String? inValue) {
                            user.setPhoneNumber = inValue!;
                          },
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
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
                            user.setEmail = inValue!;
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
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          // Lançando evento
                          BlocProvider.of<ManageBloc>(context).add(SubmitEvent(user: user));
                          BlocProvider.of<AuthBloc>(context).add(RegisterUser(
                              username: username, password: password));
                        
                        }
                      },
                      child: const Text("Cadastrar"),
                    ),
                  ],
                ),
              )
            ])));
  }
}
