
import 'package:flutter/material.dart';
import 'package:tarea_login/widgets/custom_inicio_sesion.dart';

class InicioDeSesion extends StatelessWidget{
  const InicioDeSesion({super.key});

  @override
  Widget build(BuildContext context) {
    //Tamaños
    final ancho = MediaQuery.of(context).size.width;
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

          ))
        ),
        child: Column(

          children: [
            SizedBox(height: altura/2.5,),
            const Text("Welcome", style: textLoguinStyle,),
            
            Expanded(child: Container(
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.elliptical(50, 50)
                )
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Login", style: TextStyle(fontSize: 40),),
                    SizedBox(height: 20,),
                    Wrap(
                      runSpacing: 30,
                      children: [
                        CustomInicio(),
                    CustomInicio(),
                    ElevatedButton(onPressed: (){}, child: Text("data"))
                      ],
                    ),
                    Text("OR"),
                    Row(children: [Icon(Icons.face), Icon(Icons.one_x_mobiledata_rounded), Icon(Icons.access_alarm_sharp)],),
                    Text("New here? ")
                  ],),
                ),
            )
            )
          ],
        )
      ),
    );
  }

}