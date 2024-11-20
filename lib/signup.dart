import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pargavan/home.dart';
import 'package:pargavan/main.dart';
import 'package:pargavan/navigate.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: _buildInputDecoration(
                        'Name',
                        'Enter Name',
                        Icons.account_box,
                        Colors.black,
                      ),
                      style: const TextStyle(fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                      validator: (value) {
                        return value == null || value.isEmpty ? 'Enter Name' : null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: _buildInputDecoration(
                        'Email',
                        'Enter Email',
                        Icons.email,
                        Colors.black,
                      ),
                      style: const TextStyle(fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                      validator: (value) {
                        return value == null || value.isEmpty ? 'Enter Email' : null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: _buildInputDecoration(
                        'Password',
                        'Enter Password',
                        Icons.lock,
                        Colors.black,
                      ),
                      obscureText: true,
                      style: const TextStyle(fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                      validator: (value) {
                        return value == null || value.isEmpty ? 'Enter Password' : null;
                      },
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      decoration: _buildInputDecoration(
                        'Gender',
                        'Select Gender',
                        Icons.person_outline,
                        Colors.black,
                      ),
                      items: ['Male', 'Female', 'Others'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 16, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {},
                      validator: (value) {
                        return value == null || value.isEmpty ? 'Select Gender' : null;
                      },
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          emailController.clear();
                          passwordController.clear();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Success'),
                                content: const Text('Submitted Successfully!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {                                  
                                      Navigator.of(context).pop(); 
                                      Get.to(const MyHomePage());                                      
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      color: const Color.fromARGB(255, 218, 224, 220),
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 5,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, String hint, IconData icon, Color color) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: TextStyle(color: color, fontWeight: FontWeight.w600),
      hintStyle: const TextStyle(color: Color.fromARGB(128, 96, 83, 83), fontStyle: FontStyle.italic),
      prefixIcon: Icon(icon, color: color),
      filled: true,
      fillColor: Colors.grey.shade100,      
      );
  }
}
