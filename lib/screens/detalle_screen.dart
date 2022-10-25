import 'package:examen_parcial_dos/data/data.dart';
import 'package:examen_parcial_dos/models/user.dart';
import 'package:flutter/material.dart';

class DetalleScreen extends StatefulWidget {
  DetalleScreen({Key? key, required this.users}) : super(key: key);
  User users;
  @override
  _DetalleScreenState createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Detalle'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/logo.jpg')),
            ),
            const Text(
              'Nombre:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(widget.users.nombre),
            const SizedBox(height: 5),
            const Text('Usuario:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(widget.users.usuario),
            const SizedBox(height: 5),
            const Text('Escolaridad:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(widget.users.escolaridad),
            const SizedBox(height: 5),
            const Text('Estado civil:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(widget.users.estadoCivil),
            const SizedBox(height: 5),
            const Text('Habilidades:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(widget.users.habilidades)
          ],
        ),
      ),
    );
  }
}
