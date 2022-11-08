import 'package:flutter_application_1/autentificacion/main_pagina.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

//En esta funcion principal esta ejecutando la app que nos lleva a la pagina de inicio
void main() async {
  //asincrona es querer acceder continuamente a nuestro proyecto y
  //al BackEnd de FireBase

  //creamos WidgetsFlutterBinding que nos da acceso al codigo principal
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home nos lleva a el inicio de sesion
      home: Main_pagina(),
    );
  }
}
