import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pargavan/home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namecontroller =TextEditingController();
  TextEditingController gendercontroller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                      controller: namecontroller,
                      keyboardType: TextInputType.name,
                      decoration: _buildInputDecoration(
                        'Name',
                        'Enter Name',
                        Icons.account_box,
                        Colors.black,
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                      validator: (value) {
                        return value == null || value.isEmpty ? 'Enter Name' : null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: _buildInputDecoration(
                        'Email',
                        'Enter Email',
                        Icons.email,
                        Colors.black,
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                      validator: (value) {
                        return value == null || value.isEmpty ? 'Enter Email' : null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: _buildInputDecoration(
                        'Password',
                        'Enter Password',
                        Icons.lock,
                        Colors.black,
                      ),
                      obscureText: true,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                      validator: (value) {
                        return value == null || value.isEmpty ? 'Enter Password' : null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: _buildInputDecoration(
                        'Confirm Password',
                        'Enter Password',
                        Icons.lock,
                        Colors.black,
                      ),
                      obscureText: true,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                      validator: (value) {
                        return value == null || value.isEmpty ? 'Confirm Enter Password' : null;
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
                            style: const TextStyle(                              
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
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
                          Get.to( barathi());
                          namecontroller.clear();
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
