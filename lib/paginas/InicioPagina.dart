import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InicioPagina extends StatefulWidget {
  const InicioPagina({super.key});

  @override
  State<InicioPagina> createState() => _InicioPagina();
}

class _InicioPagina extends State<InicioPagina> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sesion Iniciada: \n' + user.email!,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),

          //Boton para cerrar sesion
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.deepPurple[200],
            child: Text('Cerrar sesión',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
          )
        ],
      )),
    );
  }
}
