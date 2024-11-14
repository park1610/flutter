import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pargavan/signup.dart';
import 'package:pargavan/main.dart';
import 'package:pargavan/home.dart';
import 'package:pargavan/navigate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final newkey = GlobalKey<FormState>();

TextEditingController emailController= TextEditingController();
TextEditingController passwordController= TextEditingController();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
        ),
        body: Form(
          key: newkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 35,
                    color: Color.fromARGB(255, 3, 16, 15),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
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
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    return value == null || value.isEmpty ? 'Enter Password' : null;
                  },
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);
                    if (newkey.currentState!.validate()) {
                      Get.to(MyHomePage());
                      emailController.clear();
                      passwordController.clear();
                    }
                  },
                  color: Colors.purple,
                  textColor: Colors.white,
                  child: const Text('Login'),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {
                    Get.to(Signup());
                  },
                  color: Colors.black12,
                  textColor: Colors.white,
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
