import 'package:flutter/material.dart';


class Notification1
 extends StatefulWidget {
  const Notification1
  ({super.key});

  @override
  State<Notification1> createState() => _NotificationState();
}

class _NotificationState extends State<Notification1> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: const Color.fromARGB(255, 5, 23, 216),
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
                 "notification",
                  style: TextStyle(color: Color.fromARGB(255, 209, 28, 28), fontSize: 50 ),
                  selectionColor: Color.fromARGB(0, 23, 23, 186),
                ),
              ],
            ),
          
        ); 
  }
}
