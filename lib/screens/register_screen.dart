import 'package:examen_parcial_dos/models/user.dart';
import 'package:examen_parcial_dos/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();
  TextEditingController usuario = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  String escolaridad = "";
  String habilidades = "";
  String estadocivil = "";
  String drop = 'Escolaridad';
  String? estado;
  bool j = false;
  bool c = false;
  bool cc = false;
  List<String> items = <String>[
    'Escolaridad',
    'Licenciatura',
    'Maestría',
    'Doctorado'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScaffoldMessenger(
        key: key,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.redAccent,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }),
            title: const Text('Registro'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                    radius: 50, backgroundImage: AssetImage('assets/logo.jpg')),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Nombre',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                      controller: name,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Nombre'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Usuario',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Contraseña',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                      obscureText: true,
                      controller: password,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Contraseña'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Estado civil',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Soltero(a)'),
                        Radio(
                            activeColor: Colors.red,
                            value: 'Soltero(a)',
                            groupValue: estado,
                            onChanged: (value) {
                              setState(() {
                                estado = value.toString();
                                estadocivil = estado!;
                              });
                            }),
                        const Text('Casado(a)'),
                        Radio(
                            activeColor: Colors.red,
                            value: 'Casado(a)',
                            groupValue: estado,
                            onChanged: (value) {
                              setState(() {
                                estado = value.toString();
                                estadocivil = estado!;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Escolaridad',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    child: DropdownButton(
                      value: drop,
                      items: items
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      underline: Container(),
                      isExpanded: true,
                      dropdownColor: Colors.redAccent,
                      onChanged: (String? value) {
                        setState(() {
                          drop = value!;
                          escolaridad = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Habilidades',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Java'),
                        Checkbox(
                            activeColor: Colors.red,
                            value: j,
                            onChanged: (bool? value) {
                              setState(() {
                                habilidades += 'Java ';
                                j = value!;
                              });
                            }),
                        const Text('C#'),
                        Checkbox(
                            activeColor: Colors.red,
                            value: c,
                            onChanged: (bool? value) {
                              setState(() {
                                habilidades += 'C# ';
                                c = value!;
                              });
                            }),
                        const Text('C++'),
                        Checkbox(
                            activeColor: Colors.red,
                            value: cc,
                            onChanged: (bool? value) {
                              setState(() {
                                habilidades += 'C++ ';
                                cc = value!;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    if (validaciones()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
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
                        'Registrarse',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validaciones() {
    if (usuario.text.isEmpty ||
        name.text.isEmpty ||
        password.text.isEmpty ||
        escolaridad.isEmpty ||
        escolaridad == 'Escolaridad' ||
        habilidades.isEmpty ||
        estadocivil.isEmpty) {
      showAlert('Complete todos los campos');
      return false;
    }
    if (user.where((element) => usuario.text == element.usuario).isNotEmpty) {
      showAlert('Ya existe el usuario ingresado');
      return false;
    }
    user.add(User(usuario.text, name.text, password.text, estadocivil,
        escolaridad, habilidades));
    return true;
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
}
