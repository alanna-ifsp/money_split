import 'package:atividade03_teste/screens/movements_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../bloc/manage_bloc.dart';
// import '../bloc/monitor_bloc.dart';
// import 'add_note.dart';
// import 'list_note.dart';
import 'login_screen.dart';
import 'first_screen.dart';
import 'friends_screen.dart';
import 'historic_screen.dart';

import '../bloc/auth_bloc.dart';

import 'register_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro do Firebase"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return authenticatedWidget(context);
        } else {
          return unauthenticatedWidget(context);
        }
      },
    );
  }
}

Widget authenticatedWidget(BuildContext context) {
  return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 122, 86, 184),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(Logout());
            },
            child: const Icon(Icons.logout)),
        body: const TabBarView(
          children: [
            HistoricScreen(),
            MovimentScreen(),
            FriendsScreen(),
          ],
        ),
        appBar: AppBar(
            title: const Text("Sua Página",
                style: TextStyle(fontWeight: FontWeight.bold)),
            bottom: const TabBar(
              tabs: [Tab(text: "Histórico"), Tab(text:"Gastos"),Tab(text: "Amigos")],
            )),
      ));
}

Widget unauthenticatedWidget(BuildContext context) {
  return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 122, 86, 184),
        body: const TabBarView(
          children: [FirstScreen(), RegisterScreen(), LoginScreen()],
        ),
        appBar: AppBar(
          title: const Text("MoneySplit",
              style: TextStyle(fontWeight: FontWeight.bold)),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Tela Inicial"),
              Tab(text: "Novo Cadastro"),
              Tab(text: "Efetuar Login")
            ],
          ),
        ),
      ));
}
