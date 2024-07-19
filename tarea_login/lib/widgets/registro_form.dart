import 'package:flutter/material.dart';
import 'package:tarea_login/widgets/custom_textForms.dart';

class FormRegistro extends StatelessWidget {
  const FormRegistro({
    super.key,
    required this.formkey,
    required this.nombreController,
    required this.correoController,
    required this.telefonoController,
    required this.contraseniaController,
    required this.confirmarContraseniaController,
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController nombreController;
  final TextEditingController correoController;
  final TextEditingController telefonoController;
  final TextEditingController contraseniaController;
  final TextEditingController confirmarContraseniaController;

  @override
  Widget build(BuildContext context) {
    return Form(
      
      key: formkey,
      child: Column(
        children: [
          CustomFormRegistro(
            label: 'Nombre',
            controller: nombreController,
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
            controller: correoController,
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
          CustomFormRegistro(
            label: 'Teléfono',
            controller: telefonoController,
            validator: (valor) {
              if (valor == null || valor.isEmpty) {
                return 'El teléfono es obligatorio';
              }
              if (!RegExp(r'^[39][0-9]{7}$').hasMatch(valor)) {
                return 'Ingrese un número de teléfono válido (8 dígitos, comienza con 3 o 9)';
              }
              return null;
            },
            keyboardType: TextInputType.phone,
            hintText: 'Ingrese su número de teléfono',
          ),
          CustomFormRegistro(
            label: 'Contraseña',
            controller: contraseniaController,
            obscureText: true,
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
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.remove_red_eye),
            hintText: 'Ingrese su contraseña',
          ),
          CustomFormRegistro(
            label: 'Confirmar Contraseña',
            controller: confirmarContraseniaController,
            obscureText: true,
            validator: (valor) {
              if (valor == null || valor.isEmpty) {
                return 'La confirmación de la contraseña es obligatoria';
              }
              if (valor != contraseniaController.text) {
                return 'Las contraseñas no coinciden';
              }
              return null;
            },
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.remove_red_eye),
            hintText: 'Confirme su contraseña',
          ),
         
        ],
      ),
    );
  }
}