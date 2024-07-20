
import 'package:flutter/material.dart';
import 'package:tarea_login/widgets/pasando_usuario.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textoStyle = TextStyle(color: Colors.white, fontSize: 15);
    final cierreSesion= ModalRoute.of(context)!.settings.arguments as TransferenciaUsuario;
    final altura = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: Container(
       
        child: FloatingActionButton(onPressed: (){
          Navigator.pop(context);
          Navigator.of(context).pushNamed('inicio_sesion', arguments: cierreSesion.listaUsers);
        }, child:Icon(Icons.logout)
            
         ),
      ),
      //Header
      
      appBar: AppBar(
        
        toolbarHeight: altura * 0.12,
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
             
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenido,",
                    style: TextStyle(fontSize: 30),
                  ),
                  FittedBox(child: Text("${cierreSesion.Cuenta['nombre']}")),
                  FittedBox(
                    child: Text(
                      "${cierreSesion.Cuenta['correo']}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const FittedBox(
              fit: BoxFit.contain,
              child: CircleAvatar(
                maxRadius: 35,
                backgroundImage: NetworkImage(
                  'https://scontent.ftgu3-4.fna.fbcdn.net/v/t39.30808-6/432991802_8058643620831708_7338276069678422921_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Byi-hQu4xncQ7kNvgFTVG83&_nc_ht=scontent.ftgu3-4.fna&oh=00_AYB0kRDK8Vbx_LI_GZbFQKByEIxj498NLxUVn5zVYGFcLQ&oe=669CB2C0',
                ),
              ),
            ),
          ],
        ),

      ),

      //Body
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
        
          alignment: Alignment.center,
          height: altura,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 88, 111, 122),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: ExpansionTile(
                    textColor: textoStyle.color,
                    backgroundColor: Colors.indigo,
                    title: Text("Informacion del perfil",),
                    
                    children: [
                      Text("Nombre: ${cierreSesion.Cuenta['nombre']}", style: textoStyle,),
                      Text("Correo: ${cierreSesion.Cuenta['correo']}", style: textoStyle,),
                      Text("Telefono: ${cierreSesion.Cuenta['telefono']}", style: textoStyle,)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Card(
                  color: const Color.fromARGB(255, 100, 119, 129),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Color.fromARGB(255, 51, 145, 54),
                          size: 100,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Has ingresado exitosamente",
                          style: TextStyle(
                            fontSize: 35,
                            color: textoStyle.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
