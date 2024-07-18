import 'package:flutter/material.dart';

class SubmitCustom extends StatefulWidget {
  SubmitCustom({
    super.key,
    required this.formkey,
    required this.ancho,
    required this.registrando,
    required this.nombreController,
    required this.correoController,
    required this.telefonoController,
    required this.contraseniaController,
    this.usuarios,
  });

  final double ancho;
  final List registrando;
  final GlobalKey<FormState> formkey;
  final TextEditingController nombreController;
  final TextEditingController correoController;
  final TextEditingController telefonoController;
  final TextEditingController contraseniaController;
  List? usuarios;

  @override
  State<SubmitCustom> createState() => _SubmitCustomState();
}

class _SubmitCustomState extends State<SubmitCustom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(Size(widget.ancho * 0.7, 50)),
        backgroundColor: WidgetStateProperty.all(Color.fromARGB(176, 255, 149, 10)),
      ),
      child: const Icon(Icons.save),
      onPressed: () {
        if (!widget.formkey.currentState!.validate()) return;

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Guardando"),
              content: Text("¿Está seguro que desea continuar?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () {
                    final datos = {
                      'nombre': widget.nombreController.text,
                      'correo': widget.correoController.text,
                      'telefono': widget.telefonoController.text,
                      'password': widget.contraseniaController.text
                    };
                    if (widget.usuarios == null) {
                      widget.registrando.add(datos);
                      widget.usuarios = widget.registrando;
                    } else {
                      widget.usuarios?.add(datos);
                    }
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Usuario Agregado con éxito"),
                        );
                      },
                    );
                  },
                  child: Text("Aceptar"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
