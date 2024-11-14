import 'package:flutter/material.dart';

class barathi extends StatelessWidget {
  const barathi({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 62, 224, 8),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 208, 208, 205),
          title: Center(
            child: Text(
              "Home ",
              textAlign: TextAlign.start,
            ),
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
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50,bottom: 20),
                      child: Text('all todos',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                    )
                  ],
                ),
              ),
              
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),                
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color:Colors.black,
                      size: 20,                      
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      maxWidth: 25,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey)
                    ),
                ),                
              )
              
            ],
          ),
        ),
       
          
        );        
        // Container
  }
}
