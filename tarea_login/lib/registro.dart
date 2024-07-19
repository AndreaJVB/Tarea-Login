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
   
    List? user = ModalRoute.of(context)!.settings.arguments as List?;

      final FormRegistro formularioUsuarios = FormRegistro(formkey: formkey, nombreController: nombreController, 
                    correoController: correoController, telefonoController: telefonoController, 
                    contraseniaController: contraseniaController, 
                    confirmarContraseniaController: confirmarContraseniaController,);

      final alto = MediaQuery.of(context).size.height;
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
        color: Color.fromARGB(255, 30, 30, 92), // Set the background color here
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          // Add SingleChildScrollView to handle overflow
          child: Column(
            children: [
              Text(
                'New Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textStyle.color
                ),
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
              FormRegistro(formkey: formkey, nombreController: nombreController, correoController: correoController,
               telefonoController: telefonoController, contraseniaController: contraseniaController, 
               confirmarContraseniaController: confirmarContraseniaController),

                OutlinedButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(20),
                  fixedSize: WidgetStateProperty.all(Size(ancho*0.4, 30)),
                   backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 248, 129, 17)),
                ),
              child: Text("Sign up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
              onPressed: () {
                if (!formkey.currentState!.validate()) return;

                final datos = {
                  'nombre': nombreController.text,
                  'correo': correoController.text,
                  'telefono': telefonoController.text,
                  'password': contraseniaController.text
                };
                if (user == null){
                  user = [];
                  user?.add(datos);
                
                }else{
                  user?.add(datos);
                }
                  
                  print(user);
              },
            ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have an Account?", style: TextStyle(fontSize: textStyle.fontSize,color: textStyle.color),),
                  Expanded(
                    child: TextButton(onPressed: (){
                      print(user);
                      Navigator.of(context).pushReplacementNamed('inicio_sesion', );
                    }, child: Text("Log in here", style: TextStyle(color: Color.fromARGB(255, 248, 129, 17), fontSize: textStyle.fontSize, fontStyle: FontStyle.italic),)),
                  )
                ],
              )
          ])
        )
      ),
        
    );
  }

  
}
