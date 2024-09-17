import 'package:flutter/material.dart';


class barathi
 extends StatelessWidget {
  const barathi
  ({super.key});
  


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: const Color.fromARGB(255, 160, 171, 155),
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          backgroundColor: const Color.fromARGB(255, 213, 232, 5),
          title: const Text(
            "New App",
            textAlign: TextAlign.start,
          ),
        ), // AppBar
        body: const Column(
                 
              
              children: [
                Text(
                 "Welcome",
                  style: TextStyle(color: Color.fromARGB(255, 209, 28, 28), fontSize: 50 ),
                  selectionColor: Color.fromARGB(0, 23, 23, 186),
                ),
              ],
            ),
          
        ); // Container

  }
}
