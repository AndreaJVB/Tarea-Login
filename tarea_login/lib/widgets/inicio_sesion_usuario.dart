
import 'package:flutter/material.dart';
import 'package:tarea_login/widgets/custom_forms.dart';



class InicioSesionUsuarios extends StatelessWidget {
  const InicioSesionUsuarios({super.key});
  

  @override
  Widget build(BuildContext context) {

    final usuarios = ModalRoute.of(context)!.settings.arguments as List?;

      final listaUsuarios = [];
     
      final ancho= MediaQuery.of(context).size.width;
      final correo = TextEditingController();
      final password = TextEditingController();

    return SingleChildScrollView(
      
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Text("Login", style: TextStyle(fontSize: 35),),
                    const SizedBox(height: 10,),
                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 5,
                      children: [
                        CustomFormRegistro(label: "Correo", controller: correo, keyboardType: TextInputType.emailAddress, prefixIcon: const Icon(Icons.person),),
                        CustomFormRegistro(label: "Contraseña", controller: password, keyboardType: TextInputType.visiblePassword, prefixIcon: const Icon(Icons.password), obscureText: true,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(style: ButtonStyle(
                              fixedSize: WidgetStateProperty.all(Size(ancho/1.5, 0)),
                              backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 6, 38, 66))
                              ),
                              onPressed: () {
                                print(usuarios);
                                
                              }, child: const Text("SIGN UP", style: TextStyle(color: Colors.white),)
                              ),
                          ],
                        ),
                        const Text("OR",),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [IconButton(onPressed: (){}, icon: const Icon(Icons.facebook), style: ButtonStyle(iconSize: WidgetStateProperty.all(40)),),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.email),style: ButtonStyle(iconSize: WidgetStateProperty.all(40))),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.access_time_filled_sharp),style: ButtonStyle(iconSize: WidgetStateProperty.all(40)))
                            ],
                          ),
                        Row(children: [const Text("New here? "),
                            TextButton(onPressed: (){
                              listaUsuarios.add("hola");
                              Navigator.of(context).pushNamed('registro', arguments: usuarios);
                              
                            }, child: const Text("Sign in")),
                        ],)
                      ],
                    ),
                    
                  ],),
                );
  }
}