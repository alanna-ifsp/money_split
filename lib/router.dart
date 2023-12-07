import 'package:atividade03_teste/bloc/manage_provider.dart';
import 'package:atividade03_teste/bloc/monitor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



 import 'screens/register_screen.dart';

class AppRouter {
  final ManageBloc _manageBloc = ManageBloc();
  final MonitorBloc _monitorBloc = MonitorBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case "/add":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _manageBloc,
                child: RegisterScreen()
                  // title: "Add Note",
                  // child: AddNote(),
                ));

      case "/list":
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: _manageBloc),
                      BlocProvider.value(value: _monitorBloc)
                    ],
                    child: RegisterScreen()
                      // title: "List Note",
                      // child: ListNote(),
                    ));

      default:
        return MaterialPageRoute(builder: (_) => const Text("Erro"));
    }
  }

  void dispose() {
    _manageBloc.close();
    _monitorBloc.close();
  }
}
