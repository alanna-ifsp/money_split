import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/fundo.png"),
              fit: BoxFit.cover,
            )),
            child: ListView(children: [

                     const SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerRight,
                    child:
                  const Text(
                 "Bem-Vindo ao aplicativo que vai colocar as suas finanças em ordem",
                   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 20
                     )
                   )),
                                 Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
                    fit: BoxFit.fitHeight,
                  ),
                )),
                   const Text(
                 "Não importa se quer dividir suas contas com amigos, colegas de trabalho, família",
                   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                           fontSize: 20
                     )
                   ),
                   const SizedBox(height: 30),
                       const Text(
                 "Basta criar uma conta ou entrar,caso já seja cadastrado,e cuidar da sua vida financeira!",
                   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                           fontSize: 20
                     )
                   )
              
            ])));
  }
}

//     return SizedBox.expand(
//       child: FittedBox(
//         fit: BoxFit.fitWidth,
//         alignment: Alignment.topCenter,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             const Text("O que é o MoneySplit?",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold)),
//             Row(
//               children: [
//                 Container(
//                   height: 200,
//                   width: 200,
//                   padding: const EdgeInsets.all(10.0),
//                   decoration: const BoxDecoration(
//                       image: DecorationImage(
//                     image: AssetImage("assets/fundo.png"),
//                     fit: BoxFit.cover,
//                   )),
//                   child: Image.network(
//                       "https://cdn-icons-png.flaticon.com/512/4862/4862695.png"),
//                 ),
//                 const Text(
//                   "Bem-Vindo ao aplicativo que vai\ncolocar as suas finanças em ordem.\nNão importa se quer dividir suas contas\ncom amigos, colegas de trabalho, família.\nBasta criar uma conta ou entrar,\ncaso já seja cadastrado,\ne cuidar da sua vida financeira!",
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
