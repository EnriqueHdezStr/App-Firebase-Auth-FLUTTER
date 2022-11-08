import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/autentificacion/auth_pagina.dart';
import '../paginas/login_pagina.dart';
import '../paginas/InicioPagina.dart';

class Main_pagina extends StatelessWidget {
  const Main_pagina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return InicioPagina();
          } else {
            return AutentificacionPagina();
          }
        },
      ),
    );
  }
}
