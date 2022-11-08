import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistroPagina extends StatefulWidget {
  final VoidCallback mostrarPagDeLogin;
  const RegistroPagina({Key? key, required this.mostrarPagDeLogin})
      : super(key: key);

  @override
  State<RegistroPagina> createState() => _RegistroPagina();
}

class _RegistroPagina extends State<RegistroPagina> {
  //CONTROLES DE TEXTO
  final _emailcontrolador = TextEditingController();
  final _contrasenacontrolador = TextEditingController();
  final _confirmcontrasenacontrolador = TextEditingController();
  @override
  //Desechamos controladores para ahorrar cache
  void dispose() {
    _emailcontrolador.dispose();
    _contrasenacontrolador.dispose();
    _confirmcontrasenacontrolador.dispose();
    super.dispose();
  }

//METODO DE REGISTRARSE
//
  Future registrarse() async {
    if (confirmar_password()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontrolador.text.trim(),
        password: _contrasenacontrolador.text.trim(),
      );
    }
  }

  //DECLARACION PARA COMPARAR CONTRASEÑAS Y QUE SEAN IGUALES
  bool confirmar_password() {
    if (_contrasenacontrolador.text.trim() ==
        _confirmcontrasenacontrolador.text.trim()) {
      return true;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Apariencia de la app

      backgroundColor: Colors.grey[300], //color de fondo gris
      body: SafeArea(
        //cuerpo
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //LOGOTIPO
                Icon(
                  Icons.person_add,
                  size: 100,
                ),

                //espaciado con caja de tamaño
                SizedBox(height: 10),

                //Texto de Bienvenida para saludar a usuario
                Text('Registrate!',
                    //Hacemos el texto mas grande y damos estilo
                    style: GoogleFonts.bebasNeue(fontSize: 54)),

                //espaciado con caja de tamaño
                SizedBox(height: 15),
                Text('Registrate a continuación con tus datos!',
                    textAlign: TextAlign.center,

                    //Hacemos el texto mas grande y damos estilo
                    style: TextStyle(fontSize: 20)),

                //espaciado con caja de tamaño
                SizedBox(height: 50),
                //⛨⛨⛨⛨Campo de texto del email del usuario⛨⛨⛨⛨
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailcontrolador,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_outlined,
                          color: Color.fromARGB(210, 114, 114, 113),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 234, 27, 189)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Correo electronico',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),

                //espaciado con caja de tamaño
                SizedBox(height: 10),

                //⛨⛨⛨⛨Campo de texto del contraseña del usuario⛨⛨⛨⛨
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _contrasenacontrolador,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.key,
                          color: Color.fromARGB(210, 114, 114, 113),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 234, 27, 189)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Contraseña',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),

                //espaciado con caja de tamaño
                SizedBox(height: 10),

                //⛨⛨⛨⛨VALIDACION  contraseña del usuario⛨⛨⛨⛨
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _confirmcontrasenacontrolador,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.key,
                          color: Color.fromARGB(210, 114, 114, 113),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 234, 27, 189)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Confirmar contraseña',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                //espaciado con caja de tamaño
                SizedBox(height: 10),
                //Boton de registro

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    //metodo para registro
                    onTap: registrarse,

                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 234, 27, 110),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Registrarse',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //espaciado con caja de tamaño
                SizedBox(height: 25),

                //Boton de registro!! Por si no es un miembro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Ya soy miembro?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.mostrarPagDeLogin,
                      child: Text(
                        ' Iniciar sesion.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 122, 214),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
