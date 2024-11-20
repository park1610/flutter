import 'package:flutter/material.dart';
import 'package:pargavan/main.dart';

class barathi extends StatelessWidget {
  const barathi({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 237, 236),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 208, 208, 205),
          title: Text(              
            "Home ",
            textAlign: TextAlign.center,              
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 216, 213, 216),
                ),
                child: Text(
                  'Settings',
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                title: const Text('Profile'),
                onTap: () {
                  
                },
              ),
              ListTile(
                title: const Text('Account'),
                onTap: () {
                  // Update the state of the app.
                },
              ),
            ],
          ),
        ),
            
        body: Container(          
          padding: const EdgeInsets.all(8.0),
          child: ListView( 
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            prototypeItem: const SizedBox(width: 200, height: 100,), 
                physics: const AlwaysScrollableScrollPhysics(),  
                children: [
                  Image.asset('assets/logo.png'),
                ],              
              
              ),
        )
    );     
  }
}
