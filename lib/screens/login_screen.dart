import 'package:examen_parcial_dos/data/data.dart';
import 'package:examen_parcial_dos/screens/lista_screen.dart';
import 'package:examen_parcial_dos/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usuario = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScaffoldMessenger(
        key: key,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.redAccent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('assets/logo.jpg')),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Inicio de sesión',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.deepOrange, width: 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: usuario,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Usuario'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.deepOrange, width: 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Contraseña'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    if (validaciones()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListaScreen()),
                          (route) => false);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿No tienes una cuenta?  ',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    }),
                    child: const Center(
                      child: Text(
                        'Registrarse',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlert(String contenido) {
    final snackbar = SnackBar(
        backgroundColor: const Color.fromARGB(255, 168, 19, 9),
        duration: const Duration(seconds: 1),
        content: Text(
          contenido,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
          ),
        ));
    key.currentState!.showSnackBar(snackbar);
  }

  bool validaciones() {
    var us = user.where((element) => element.usuario == usuario.text).toList();

    if (usuario.text.isEmpty || password.text.isEmpty) {
      showAlert('Complete todos los campos');
      return false;
    }
    if (us.isNotEmpty) {
      var login = us[0];
      if (login.password == password.text) ;
      return true;
    }
    showAlert('Usuario o constraseña incorrectos');
    return false;
  }
}
