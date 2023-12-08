import 'package:flutter/material.dart';
import 'package:atividade03_teste/provider/rest_provider_user.dart';
import 'package:atividade03_teste/model/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:atividade03_teste/model/user_model.dart';

var outros = [];

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  UserModel? authenticatedUser;

  @override
  void initState() {
    super.initState();
    getAllUser();
  }

  Future<void> getAllUser() async {
    outros.clear();
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
      } else {
        if (user.getName != null) {
          outros.add(user.getName);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/fundo.png"), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Amigos de ${authenticatedUser?.getName}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
                itemCount: outros.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.black, width: 3))),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.max,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
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
                              "https://cdn-icons-png.flaticon.com/512/6386/6386976.png"),
                        ),
                        Text(outros[index],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
