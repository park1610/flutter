import 'package:flutter/material.dart';
import 'package:pargavan/main.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('login screen'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'login',
             style:TextStyle(
              fontSize: 35,
              color:Colors.teal, 
              fontWeight: FontWeight.bold            
              ),
              ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'email',
                      hintText:'enter email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value){
            
                    },
                    validator: (value) {
                      return value!.isEmpty ? 'Enter Email':null;
                    },
                  ),
                  SizedBox(height: 30,),
                  
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText:'enter Password',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value){
            
                    },
                    validator: (value) {
                      return value!.isEmpty ? 'Enter Password':null;
                    },
                  ), 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: (){},
                      color: Colors.purple,
                      textColor: Colors.white,
                      child: Text('Login'),
                    ),
                  ),
                ],              
              ),
            ),
          ),//form
          ],
          ),          
        ),
      );
    
  }
}


  

