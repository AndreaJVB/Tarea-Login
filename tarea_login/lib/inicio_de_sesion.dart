
import 'package:flutter/material.dart';
import 'package:tarea_login/widgets/inicio_sesion_usuario.dart';


class InicioDeSesion extends StatelessWidget{
  const InicioDeSesion({super.key});
  

  @override
  Widget build(BuildContext context) {
   
    //Tamaños
    
    final altura = MediaQuery.of(context).size.height;
    const textLoguinStyle = TextStyle(fontSize: 50, fontFamily: "Arial", fontWeight: FontWeight.w700, color: Colors.white);
    
    return Scaffold(
      
      body: Container(
        alignment: Alignment.center,
        height: altura,
        width: double.infinity,

        decoration: const BoxDecoration(

          image: DecorationImage(
            alignment: Alignment.topCenter,
            colorFilter: ColorFilter.mode(Color.fromARGB(255, 19, 112, 189), BlendMode.overlay),
            image: AssetImage(
            "assets/images/cover.jpg",
          ), 
            fit: BoxFit.fitWidth
          )
        ),
        child: Column(

          children: [
            SizedBox(height: altura/3,),
            const Text("Welcome", style: textLoguinStyle,),
            
            Expanded(child: Container(
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.elliptical(50, 50)
                )
                ),
                child: const SingleChildScrollView(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(fontSize: 35),
                          ),
                          const SizedBox(height: 10),
                          InicioSesionUsuarios(),
          
        ],
      ),
    ),
            )
            )
          ],
        )
      ),
    );
  }

}