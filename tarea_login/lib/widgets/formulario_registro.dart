import 'package:flutter/material.dart';
import 'package:tarea_login/widgets/custom_text_forms.dart';

class FormularioRegistro extends StatefulWidget {
  FormularioRegistro({
    super.key,
    required this.formkey,
    required this.nombreController,
    required this.correoController,
    required this.telefonoController,
    required this.contraseniaController,
    required this.confirmarContraseniaController,
    this.usuarios
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController nombreController;
  final TextEditingController correoController;
  final TextEditingController telefonoController;
  final TextEditingController contraseniaController;
  final TextEditingController confirmarContraseniaController;
  List? usuarios;

  @override
  State<FormularioRegistro> createState() => _FormularioRegistroState();
}

class _FormularioRegistroState extends State<FormularioRegistro> {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final registrando = [];
    // List? user = ModalRoute.of(context)!.settings.arguments as List?;

    
    return Form(
      key: widget.formkey,
      child: Column(
        children: [
          CustomFormRegistro(
            label: 'Nombre',
            controller: widget.nombreController,
            validator: (valor) {
              if (valor == null || valor.isEmpty) {
                return 'El nombre es obligatorio';
              }
              if (valor.length < 3 || valor.length > 10) {
                return 'El nombre debe tener entre 3 y 10 caracteres';
              }
              return null;
            },
            prefixIcon: Icon(Icons.person),
            hintText: 'Ingrese su nombre completo',
          ),
          CustomFormRegistro(
            label: 'Correo',
            controller: widget.correoController,
            validator: (valor) {
              if (valor == null || valor.isEmpty) {
                return 'El correo es obligatorio';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(valor) ||
                  !valor.endsWith('.edu.hn')) {
                return 'Ingrese un correo válido que termine en .edu.hn';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            hintText: 'Ingrese su correo electrónico',
          ),
          CustomFormRegistro(label: 'Teléfono',  controller: widget.telefonoController,
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'El teléfono es obligatorio';
                      }
                      if (!RegExp(r'^[39][0-9]{7}$').hasMatch(valor)) {
                        return 'Ingrese un número de teléfono válido (8 dígitos, comienza con 3 o 9)';
                      }
                      return null;
                    },
            keyboardType: TextInputType.phone,   hintText: 'Ingrese su número de teléfono',),

          CustomFormRegistro( label: 'Contraseña', controller: widget.contraseniaController, obscureText: true,
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'La contraseña es obligatoria';
                      }
                      if (!RegExp(r'^(?=.*[A-Z])(?=.*\W).{8,}$')
                          .hasMatch(valor)) {
                        return 'La contraseña debe tener al menos 8 caracteres, una mayúscula y un carácter especial';
                      }
                      return null;
                    },
            prefixIcon: Icon(Icons.lock),  suffixIcon: Icon(Icons.remove_red_eye),
            hintText: 'Ingrese su contraseña', ),

          CustomFormRegistro(label: 'Confirmar Contraseña', controller: widget.confirmarContraseniaController,
            obscureText: true,
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'La confirmación de la contraseña es obligatoria';
                      }
                      if (valor != widget.contraseniaController.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
            prefixIcon: Icon(Icons.lock), suffixIcon: Icon(Icons.remove_red_eye),
            hintText: 'Confirme su contraseña',),
         
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(Size(ancho*0.7, 50)),
                backgroundColor: WidgetStateProperty.all(Color.fromARGB(176, 255, 149, 10)),
              ),

              child: const Icon(Icons.save),
              
              onPressed: () {
                if (!widget.formkey.currentState!.validate()) return;

                showDialog(context: context,
                 builder: (context){
                    return AlertDialog(
                        title: Text("Guardando"),
                        content: Text("Esta seguro que desea continuar?"),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Cancelar")),

                          TextButton(onPressed: (){
                                 final datos = {
                                      'nombre': widget.nombreController.text,
                                      'correo': widget.correoController.text,
                                      'telefono': widget.telefonoController.text,
                                      'password': widget.contraseniaController.text
                                    };
                                    if (widget.usuarios == null){
                                      registrando.add(datos);
                                      widget.usuarios = registrando;
                                    }else{
                                      widget.usuarios?.add(datos);
                                    }
                                      Navigator.of(context).pop();
                                    showDialog(context: context, builder: (context){
                                      return AlertDialog(title: Text("Usuario Agregado con exito"),);
                                    });
                                    
                          }, child: Text("Aceptar")),
                        ],
                    );
                 });
                // 

               
                
          },),
      ],
    ),
  );
}

  List? listUsuario(){
    return widget.usuarios;
  }
}
