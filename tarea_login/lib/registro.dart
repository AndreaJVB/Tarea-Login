import 'package:flutter/material.dart';
import 'package:tarea_login/widgets/registro_form.dart';

class RegistroPage extends StatelessWidget {
  RegistroPage({super.key});

  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final telefonoController = TextEditingController();
  final contraseniaController = TextEditingController();
  final confirmarContraseniaController = TextEditingController();

  //Propiedad de los usuarios
  List? usuarios;

  // El controlador del Form
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ///TextoSTyle
    TextStyle textStyle = TextStyle(fontSize: 15, color: Colors.white);

    ///
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    List? user = ModalRoute.of(context)!.settings.arguments as List?;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 156, 173, 182),
        title: Center(
          child: Text(
            'Registro',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        height: alto,
          color:
              Color.fromARGB(255, 30, 30, 92), // Set the background color here
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
              child: Column(children: [
            Text(
              'Nueva Cuenta',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textStyle.color),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 35,
              backgroundColor: Color.fromARGB(255, 240, 91, 5),
              child: Image.asset(
                'assets/images/register.png',
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            FormRegistro(
                formkey: formkey,
                nombreController: nombreController,
                correoController: correoController,
                telefonoController: telefonoController,
                contraseniaController: contraseniaController,
                confirmarContraseniaController: confirmarContraseniaController),
                SizedBox(height: 20,),
            OutlinedButton(
              style: ButtonStyle(
                elevation: WidgetStateProperty.all(20),
                fixedSize: WidgetStateProperty.all(Size(ancho * 0.45, 30)),
                backgroundColor:
                    WidgetStateProperty.all(Color.fromARGB(255, 248, 129, 17)),
              ),
              
              child: Text(
                "Registrarse",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                    textAlign: TextAlign.center,
              ),
              onPressed: () {
                print(user);
                if (!formkey.currentState!.validate()) return;
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Seguro que quiere guardar la cuenta?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                final datos = {
                                  'nombre': nombreController.text,
                                  'correo': correoController.text,
                                  'telefono': telefonoController.text,
                                  'password': contraseniaController.text
                                };
                                if (user == null) {
                                  user = [];
                                  user?.add(datos);
                                } else {
                                  user?.add(datos);
                                }

                                Navigator.of(context).pop();
                                Navigator.pushNamed(context, 'registro',
                                    arguments: user);
                              },
                              child: Text("Aceptar")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancelar"))
                        ],
                      );
                    });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ya tienes una cuenta?",
                  style: TextStyle(
                      fontSize: textStyle.fontSize, color: textStyle.color),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        print(user);

                        Navigator.of(context).pushReplacementNamed(
                            'inicio_sesion',
                            arguments: user);
                      },
                      child: Text(
                        "Iniciar sesion",
                        style: TextStyle(
                            color: Color.fromARGB(255, 248, 129, 17),
                            fontSize: textStyle.fontSize,
                            fontStyle: FontStyle.italic),
                      )),
                )
              ],
            )
          ]))),
    );
  }
}
