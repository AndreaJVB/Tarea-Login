import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:tarea_login/widgets/formulario_registro.dart';

class InputsPage extends StatelessWidget {
  InputsPage({super.key});

  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final telefonoController = TextEditingController();
  final contraseniaController = TextEditingController();
  final confirmarContraseniaController = TextEditingController();

  //Propiedad de los usuarios
  final usuarios = [];

  // El controlador del Form
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List? listaUsuarios = ModalRoute.of(context)!.settings.arguments as List?;

      final FormularioRegistro formularioUsuarios = FormularioRegistro(formkey: formkey, nombreController: nombreController, 
                    correoController: correoController, telefonoController: telefonoController, 
                    contraseniaController: contraseniaController, 
                    confirmarContraseniaController: confirmarContraseniaController,usuarios: listaUsuarios,);

      final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Registro     ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: alto,
          color: Colors.blueGrey[200], // Set the background color here
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            // Add SingleChildScrollView to handle overflow
            child: Column(
              children: [
                const Text(
                  '    New Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/register.png', 
                  width: 50,
                  height: 50,
                ), 
                Wrap(
                  
                  runSpacing: 30,
                  children: [
                    
                    formularioUsuarios,
        
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text("Already have an account? "),
                  TextButton(onPressed: (){
                    formularioUsuarios.usuarios;
                    Navigator.of(context).pushReplacementNamed('inicio_sesion',arguments: formularioUsuarios.usuarios);
                  }, child: Text("Log in here")),
                ],
               ) 
                ],),
                
        ]
             )
          )
        ),
      ),
         
    );
  }
  
}

