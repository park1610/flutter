import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pargavan/main.dart';
import 'package:pargavan/newapp.dart';
import 'package:pargavan/navigate.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
            padding: const EdgeInsets.symmetric(vertical:30),
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
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
                  ),
                  SizedBox(height: 30,),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
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
                  ), 
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:35),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: (){
                     Get.to(MyHomePage());
                      },
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


  

