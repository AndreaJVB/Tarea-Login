import 'package:flutter/material.dart';
import 'package:tarea_login/widgets/custom_text_forms.dart';

class InicioSesionUsuarios extends StatefulWidget {
  const InicioSesionUsuarios({super.key});

  @override
  _InicioSesionUsuariosState createState() => _InicioSesionUsuariosState();
}

class _InicioSesionUsuariosState extends State<InicioSesionUsuarios> {
  final correo = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final usuarios = ModalRoute.of(context)?.settings.arguments as List?;

    final ancho = MediaQuery.of(context).size.width;

    return Form(
            key: formkey,
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 5,
              children: [
                CustomFormRegistro(
                  label: "Correo",
                  controller: correo,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.person),
                ),
                CustomFormRegistro(
                  label: "Contraseña",
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(Icons.password),
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(Size(ancho / 1.5, 0)),
                        backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 6, 38, 66)),
                      ),
                      onPressed: () {
                        if (usuarios != null) {
                          for (var user in usuarios) {
                            if (user['correo'] == correo.text && user['password'] == password.text) {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, 'inicio_page');
                            } else {
                              print(user);
                              print("Contraseña incorrecta");
                            }
                          }
                        } else {
                          print(usuarios);
                        }
                      },
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const Text("OR"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook),
                      iconSize: 40,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.email),
                      iconSize: 40,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.access_time_filled_sharp),
                      iconSize: 40,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("New here? "),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('registro', arguments: usuarios);
                      },
                      child: const Text("Sign in"),
                    ),
                  ],
                ),
              ],
            ),
          );

  }
}

