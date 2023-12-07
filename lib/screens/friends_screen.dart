import 'package:flutter/material.dart';

var items = [];

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    items.clear();
    for (var i = 0; i < 2; i++) {
      items.add("$i");
    }
    return SizedBox.expand(
        child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Seus Amigos",
            style: TextStyle(
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
                          bottom: BorderSide(color: Colors.black, width: 3))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            "https://cdn-icons-png.flaticon.com/512/3884/3884864.png"),
                      ),
                      const Text("Felipe",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              }),
        )
      ],
    ));
  }
}
