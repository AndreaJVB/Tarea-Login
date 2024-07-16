
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
            SizedBox(height: altura/3,),
            const Text("Welcome", style: textLoguinStyle,),
            
            Expanded(child: Container(
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.elliptical(50, 50)
                )
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Text("Login", style: TextStyle(fontSize: 40),),
                    const SizedBox(height: 20,),
                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 20,
                      children: [
                        const CustomInicio(),
                        const CustomInicio(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(style: ButtonStyle(fixedSize: WidgetStateProperty.all(Size(200, 0))),onPressed: (){}, child: Text("SIGN UP")),
                          ],
                        ),
                        const Text("OR",),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [IconButton(onPressed: (){}, icon: Icon(Icons.facebook), style: ButtonStyle(iconSize: WidgetStateProperty.all(40)),),
                              IconButton(onPressed: (){}, icon: Icon(Icons.email),style: ButtonStyle(iconSize: WidgetStateProperty.all(40))),
                              IconButton(onPressed: (){}, icon: Icon(Icons.access_time_filled_sharp),style: ButtonStyle(iconSize: WidgetStateProperty.all(40)))
                            ],
                          ),
                        Row(children: [const Text("New here? "),
                            TextButton(onPressed: ()=> Navigator.of(context).pushNamed('registro'), child: Text("Sign in")),
                        ],)
                      ],
                    ),
                    
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