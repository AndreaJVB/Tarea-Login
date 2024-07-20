import 'package:flutter/material.dart';
import 'package:tarea_login/widgets/custom_textForms.dart';
import 'package:tarea_login/widgets/pasando_usuario.dart';

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
              runSpacing: 14,
              children: [
                CustomInputs(
                  label: "Correo",
                  controller: correo,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.person),
                ),
                CustomInputs(
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
                        print(usuarios);
                        if (usuarios != null) {
                          for (var user in usuarios) {
                            if (user['correo'] == correo.text && user['password'] == password.text) {
                              final argumentoUsers = TransferenciaUsuario(Cuenta: user, listaUsers: usuarios);
                              Navigator.of(context).pushNamedAndRemoveUntil('inicio_page', (Route<dynamic> route) => false,arguments: argumentoUsers);
                              break;
                            } else {
                              showDialog(context: context, builder: (context){
                            return AlertDialog(
                              elevation: 50,
                              title: Text("ERROR"),
                              icon: Icon(Icons.close_outlined, size: 50,),
                              iconColor: Color.fromARGB(255, 161, 5, 5),
                              content: Text("Usuario o contraseña incorrecta"),
                                
                            );
                          }).then((_){
                            Navigator.of(context).pushReplacementNamed('inicio_sesion', arguments: usuarios);
                          });
                            }
                          }
                        }
                      },
                      child: const Text(
                        "ACCEDER",
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
                    const Text("Nuevo aqui? "),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('registro', arguments: usuarios);
                      },
                      child: const Text("Registrarse"),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
