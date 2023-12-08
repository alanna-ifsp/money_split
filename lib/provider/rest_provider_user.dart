// Data Provider para o banco de dados local sqflite
// ignore_for_file: unused_import

import 'package:atividade03_teste/model/movements.dart';
import 'package:atividade03_teste/model/movements_model.dart';
import 'package:atividade03_teste/model/users.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'dart:async';
import '../model/user_model.dart';

class RestDataProvider {
  // Atributo que irá afunilar todas as consultas
  static RestDataProvider helper = RestDataProvider._createInstance();

  // Construtor privado
  RestDataProvider._createInstance();

  final Dio _dio = Dio();

  String prefixUrl = "https://testeatividade03-default-rtdb.firebaseio.com";
  String suffixUrl = "/.json";

  Future<UserModel> getUser(uid) async {
    Response response = await _dio.get(prefixUrl + uid + suffixUrl);
    return UserModel.fromMap(response.data);
  }

  Future<int> insertUser(UserModel user) async {
    // ignore: unused_local_variable
    Response response = await _dio.post(
      prefixUrl + suffixUrl,
      data: user.toMap(),
    );
    return 41;
  }

  Future<int> inserMoviment(MovimentModel moviment) async {
    Response response =
        await _dio.post(prefixUrl + suffixUrl, data: moviment.toMap());
    return 42;
  }

  Future<int> updateUser(id, UserModel user) async {
    Response response = await _dio.put(
      "$prefixUrl/$id$suffixUrl",
      data: user.toMap(),
    );
    return 42;
  }

  Future<int> deleteUser(id) async {
    Response response = await _dio.delete(
      "$prefixUrl/$id$suffixUrl",
    );
    return 42;
  }

  Future<UserCollection> getUsersList() async {
    Response response = await _dio.get(prefixUrl + suffixUrl);

    UserCollection userCollection = UserCollection();

    response.data.forEach((key, value) {
      UserModel user = UserModel.fromMap(value);
      userCollection.insertUserOfId(value["id"].toString(), user);
    });
    return userCollection;
  }

  Future<MovimentCollection> getMovimentList() async {
    Response response = await _dio.get(prefixUrl + suffixUrl);

    MovimentCollection userCollection = MovimentCollection();

    response.data.forEach((key, value) {
      MovimentModel moviment = MovimentModel.fromMap(value);
      userCollection.insertUserOfId(value["id"].toString(), moviment);
    });
    return userCollection;
  }

  /*
     Parte da STREAM
  */

  // Método que envia dados para a Stream
  notify(String userId, UserModel? user) async {
    _controller?.sink.add([userId, user]);
  }

  Stream get stream {
    _controller ??= StreamController.broadcast();

    Socket socket = io(
        prefixUrl,
        OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
            .build());

    socket.on('server_information', (data) {
      /*
       O servidor nos informa o dado que foi modificado.
      */
      String username = data["username"];
      String password = data["password"];
      String name = data["name"];
      int age = int.parse(data["age"]);
      String pix = data["pix"];
      String phoneNumber = data["phoneNumber"];

      String userId = data["userId"].toString();
      String title = data["title"];
      String description = data["description"];

      // Vamos assumir que "title=null" significa uma remoção.
      /*if (title == "") {
        notify(userId, null);
      } else {
        UserModel user = UserModel();
        user.title = title;
        user.description = description;
        notify(userId, user);
      }*/
    });

    return _controller!.stream;
  }

  dispose() {
    if (_controller != null) {
      if (!_controller!.hasListener) {
        _controller!.close();
        _controller = null;
      }
    }
  }

  static StreamController? _controller;
}
