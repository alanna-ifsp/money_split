import 'package:atividade03_teste/bloc/manage_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';
import 'screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBa0t6j_I0TMX3xkyCeJbn0hCu6xeJ1o4U",
      appId: "1:167183680627:web:91af6a9509c5fe46d05606",
      messagingSenderId: "167183680627",
      projectId: "testeatividade03",
      authDomain: "testeatividade03.firebaseapp.com",
      storageBucket: "testeatividade03.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class _MyAppState extends State<MyApp> {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: MultiBlocProvider(providers: [
          BlocProvider(create: (context) => AuthBloc()),
          BlocProvider(create: (context) => ManageBloc())
        ], 
        child: const Wrapper()));
    ;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  State<MyApp> createState() => _MyAppState();
}
