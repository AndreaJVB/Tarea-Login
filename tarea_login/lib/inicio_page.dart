import 'dart:developer';

import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Header
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenido, Usuario",
                    style: TextStyle(fontSize: 30),
                  ),
                  //FittedBox(
                  //child: Text(
                  //"Usuario",
                  //style: TextStyle(fontSize: 30),
                  //),
                  //),
                  FittedBox(
                    child: Text(
                      "ANDRasqsz@gmail.com",
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
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 88, 111, 122),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                            color: Colors.white,
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
