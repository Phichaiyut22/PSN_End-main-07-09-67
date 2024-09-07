// ignore_for_file: unused_field, unused_element, body_might_complete_normally_nullable, unused_import, prefer_const_constructors, must_be_immutable, use_build_context_synchronously

import 'package:budget_tracker_application_2/screens/dashboard.dart';
import 'package:budget_tracker_application_2/screens/login_screen.dart';
import 'package:budget_tracker_application_2/service/auth_service.dart';
import 'package:budget_tracker_application_2/utils/appvalidator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingUP_UI extends StatefulWidget {
  SingUP_UI({super.key});

  @override
  State<SingUP_UI> createState() => _SingUP_UIState();
}

class _SingUP_UIState extends State<SingUP_UI> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  var authService = AuthService();
  var isLoader = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });

      var data = {
        "username": _userNameController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
        "phone": _phoneController.text,
        'remainingAmount':0,
        'totalCredit':0,
        'totalDebit':0,


      };

      await authService.createUser(data, context);
    
      setState(() {
        isLoader = false;
      });
    }
  }

  var appValidator = Appvalidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF252634),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 80.00),
                SizedBox(
                  width: 150.00,
                  child: Text(
                    "Create New Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.00,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50.00),
                TextFormField(
                  controller: _userNameController,
                  style: TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _bulidInputDecoration("Username", Icons.person),
                  validator: appValidator.validateUsername,
                ),
                SizedBox(height: 16.00),
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _bulidInputDecoration("Email", Icons.email_outlined),
                  validator: appValidator.validateEmail,
                ),
                SizedBox(height: 16.00),
                TextFormField(
                  controller: _phoneController,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _bulidInputDecoration("Phone Number", Icons.call),
                  validator: appValidator.validatePhoneNumber,
                ),
                SizedBox(height: 16.00),
                TextFormField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true ,
                  decoration: _bulidInputDecoration("Password", Icons.lock),
                  validator: appValidator.validatePassword,
                ),
                SizedBox(height: 40.00),
                SizedBox(
                  height: 50.00,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                    ),
                    onPressed: () {
                      isLoader ? print("Loading") : _submitForm();
                    },
                    child: isLoader
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            "Create",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 3, 3, 3),
                              fontSize: 20.00,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 20.00),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.yellow, fontSize: 25.00),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _bulidInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
      fillColor: Color(0XFF94A59),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x35949494)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      filled: true,
      labelStyle: TextStyle(color: Color(0XFF949494)),
      labelText: label,
      suffixIcon: Icon(
        suffixIcon,
        color: Color(0XFF949494),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.00),
      ),
    );
  }
}
