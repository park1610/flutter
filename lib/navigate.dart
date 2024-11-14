import 'package:flutter/material.dart';
import 'package:pargavan/newapp.dart';
import 'package:pargavan/login.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex =1
  ;
  
    void _onDestinationSelected(int index) {
      if(index==1){

      }
    setState(() {
      _currentPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: barathi(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentPageIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            selectedIcon: Icon(Icons.notifications_active),
            label: 'Notifications',
           
          ),
          NavigationDestination(
            icon: Icon(Icons.menu),
            selectedIcon: Icon(Icons.menu_open),
            label: 'Menu',
          ),
        ],
      ),
      );
  }
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    throw UnimplementedError();
  }

 

}

