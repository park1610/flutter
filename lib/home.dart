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
        floatingActionButton: FloatingActionButton(onPressed: () {}),
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
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    color: Colors.blue,
                    height: 200,
                    child: const Text('Item 1',style: TextStyle(fontSize: 30),)
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    color: Colors.blue,
                    height: 200,
                    child: const Text('Item 2',style: TextStyle(fontSize: 30),)
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    color: Colors.blue,
                    height: 200,
                    child: const Text('Item 3',style: TextStyle(fontSize: 30),)
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    color: Colors.blue,
                    height: 200,
                    child: const Text('Item 4',style: TextStyle(fontSize: 30),)
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    color: Colors.blue,
                    height: 200,
                    child: const Text('Item 5',style: TextStyle(fontSize: 30),)
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    color: Colors.blue,
                    height: 200,
                    child: const Text('Item 6',style: TextStyle(fontSize: 30),)
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    color: Colors.blue,
                    height: 200,
                    child: const Text('Item 7',style: TextStyle(fontSize: 30),)
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    color: Colors.blue,
                    height: 200,
                    child: const Text('Item 8',style: TextStyle(fontSize: 30),)
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    color: Colors.blue,
                    height: 200,
                    child: const Text('Item 9',style: TextStyle(fontSize: 30),)
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(16),
                    color: Colors.blue,
                    height: 200,
                    child: const Text('Item 10',style: TextStyle(fontSize: 30),)
                  ),
                ],
              ),
        )
    );     
  }
}
