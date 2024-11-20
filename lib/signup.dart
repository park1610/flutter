import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
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

                // Name Input Box
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

                // Email Input Box
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

                // Password Input Box
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

                // Gender Dropdown
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
                      Get.snackbar('Success', 'Form Submitted Successfully!');
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
    );
  }

  InputDecoration _buildInputDecoration(String label, String hint, IconData icon, Color color) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: TextStyle(color: color, fontWeight: FontWeight.w600),
      hintStyle: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
      prefixIcon: Icon(icon, color: color),
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    );
  }
}
