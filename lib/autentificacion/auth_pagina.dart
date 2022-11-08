import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/login_pagina.dart';
import 'package:flutter_application_1/paginas/registro_pagina.dart';

class AutentificacionPagina extends StatefulWidget {
  const AutentificacionPagina({Key? key}) : super(key: key);

  @override
  State<AutentificacionPagina> createState() => _AutentificacionPagina();
}

class _AutentificacionPagina extends State<AutentificacionPagina> {
  //creamos un valor booleanos para mostrar la pagina de Login
  bool mostrarPaginaDeLogin = true;

  void alternarPantallas() {
    setState(() {
      mostrarPaginaDeLogin = !mostrarPaginaDeLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (mostrarPaginaDeLogin) {
      return InicioSesion_Pagina(mostrarPagDeRegistro: alternarPantallas);
    } else {
      return RegistroPagina(mostrarPagDeLogin: alternarPantallas);
    }
  }
}
