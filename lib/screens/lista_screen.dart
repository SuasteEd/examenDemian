import 'package:examen_parcial_dos/data/data.dart';
import 'package:examen_parcial_dos/screens/detalle_screen.dart';
import 'package:examen_parcial_dos/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ListaScreen extends StatefulWidget {
  const ListaScreen({Key? key}) : super(key: key);

  @override
  _ListaScreenState createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: (() {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false);
            }),
          ),
          title: const Text('Usuarios'),
        ),
        body: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetalleScreen(users: user[index])));
              },
              child: ListTile(
                title: Text(
                  user[index].nombre,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  user[index].escolaridad,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.jpg')),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
