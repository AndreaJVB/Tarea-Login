import 'package:flutter/material.dart';

class CustomInicio extends StatelessWidget{
  const CustomInicio({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const TextField(
      decoration: InputDecoration(
        hintText: "Nombre",
        prefixIcon: Icon(Icons.usb_rounded),
       
      ),
    );
  }

}