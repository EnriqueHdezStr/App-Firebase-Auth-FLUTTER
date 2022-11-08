import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InicioSesion_Pagina extends StatefulWidget {
  final VoidCallback mostrarPagDeRegistro;
  const InicioSesion_Pagina({Key? key, required this.mostrarPagDeRegistro})
      : super(key: key);

  @override
  State<InicioSesion_Pagina> createState() => _InicioSesion_Pagina();
}

class _InicioSesion_Pagina extends State<InicioSesion_Pagina> {
//Este es un StatefulWidget con estado de retorno al widget Scaffold
//CONTROLES DE TEXTO
  final _emailcontrolador = TextEditingController();
  final _contrasenacontrolador = TextEditingController();

//METODO DE INICIO DE SESION
  Future iniciarSesion() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailcontrolador.text.trim(),
      password: _contrasenacontrolador.text.trim(),
    );
  }

  @override
  //Desechamos controladores para ahorrar cache
  void dispose() {
    _emailcontrolador.dispose();
    _contrasenacontrolador.dispose();
    super.dispose();
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
                  Icons.diamond,
                  size: 100,
                  color: Color.fromARGB(210, 49, 49, 49),
                ),

                //espaciado con caja de tamaño
                SizedBox(height: 10),

                //Texto de Bienvenida para saludar a usuario
                Text('Hola De Nuevo!..',
                    //Hacemos el texto mas grande y damos estilo
                    style: GoogleFonts.bebasNeue(fontSize: 54)),

                //espaciado con caja de tamaño
                SizedBox(height: 15),
                Text('Bienvenido de Nuevo, \nLo hemos extrañado!!',
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
                          borderSide: BorderSide(color: Colors.deepPurple),
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
                          color: Color.fromARGB(210, 114, 113, 114),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Contraseña',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),

                //espaciado con caja de tamaño
                SizedBox(height: 20),

                //Boton de Inicio de sesión

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    //metodo para inicio de sesion
                    onTap: iniciarSesion,

                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 134, 99, 229),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Iniciar sesión',
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
                      '¿No eres miembro?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.mostrarPagDeRegistro,
                      child: Text(
                        ' Regístrate ahora.',
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
