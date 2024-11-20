import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pargavan/navigate.dart';
import 'package:pargavan/signup.dart';
import 'package:pargavan/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final newkey = GlobalKey<FormState>();

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto', 
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
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
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
                        print(emailController.text);
                        print(passwordController.text);
                        if (newkey.currentState!.validate()) {
                          Get.to(const MyHomePage());
                          emailController.clear();
                          passwordController.clear();
                        }
                      },
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 5,
                      padding: const EdgeInsets.symmetric(vertical: 8),
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
                      color: Colors.grey.shade300,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 5,
                      padding: const EdgeInsets.symmetric(vertical: 8),
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
    );
  }
}
