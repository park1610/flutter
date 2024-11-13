import 'package:flutter/material.dart';

class barathi extends StatelessWidget {
  const barathi({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 252, 248),
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
                  //NavigationDestination(
                  //   icon: Icon(Icons.settings),
                  //   selectedIcon: Icon(Icons.settings),
                  //   label: ('Settings'),
                  //  );
                  // // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Account'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ), // AppBar
        body: Column(
          children: [
            Image.asset("lib/assets/image/logo.png"),
            // FlutterLogo(size: 200,),
          
          ],
        )
        ); // Container
  }
}
