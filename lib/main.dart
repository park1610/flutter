import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pargavan/signup.dart';
import 'package:pargavan/home.dart';
void main() {
  runApp(const MyApp());     
}


class SnackbarGlobal {
  static GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
final newkey = GlobalKey<FormState>();

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController namecontroller =TextEditingController();
TextEditingController gendercontroller =TextEditingController();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),            
          ),
        ),        
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text(
              'NEW APP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          body: Form(
            key: newkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Email',
                      prefixIcon: Icon(Icons.email, color: Colors.black),
                    ),
                    validator: (value) {
                      return value == null || value.isEmpty ? 'Enter Email' : null;
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Password',
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                    ),
                    obscureText: true,
                    validator: (value) {
                      return value == null || value.isEmpty ? 'Enter Password' : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          if (newkey.currentState!.validate()) {
                            Get.to(barathi());
                            emailController.clear();
                            passwordController.clear();  
                            print(emailController);
                            print(passwordController);      

                          }
                        },
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          Get.to(const Signup());
                        },
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

