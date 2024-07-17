import 'package:flutter/material.dart';

class Usuario extends StatefulWidget {
  Usuario({super.key, required this.usuario});

  final Map<String, dynamic> usuario;

  @override
  State<Usuario> createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  bool verCompleto = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          '${widget.usuario['nombre']}',
          style: const TextStyle(fontSize: 30),
        ),
        children: [
          Text('Edad: ${widget.usuario['edad']} años',
              style: const TextStyle(fontSize: 20)),
          Text(!verCompleto && widget.usuario['bio'].length > 50
              ? '${widget.usuario['bio'].substring(0, 50) + '...'}'
              : widget.usuario['bio']),
          TextButton(
              onPressed: () {
                setState(() {
                  verCompleto = !verCompleto;
                });
              },
              child: Text(verCompleto ? 'Ver menos' : 'Ver más'))
        ],
      ),
    );
  }
}
