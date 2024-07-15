import 'package:flutter/material.dart';
import 'package:tarea_login/inicio_de_sesion.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'inicio_sesion',
      routes: {
        'inicio_sesion' : (context) => const InicioDeSesion(),
      }

    );
  }

}
