// ignore_for_file: must_be_immutable, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:budget_tracker_application_2/screens/dashboard.dart';
import 'package:budget_tracker_application_2/screens/sing_up.dart';
import 'package:budget_tracker_application_2/service/auth_service.dart';
import 'package:budget_tracker_application_2/utils/appvalidator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoader = false;
   var authService = AuthService();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
        setState(() {
        isLoader = true;
      });

      var data = {
    
        "email": _emailController.text,
        "password": _passwordController.text,

      };

      await authService.login(data, context);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardUI()),
      );
       
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 80.00,
                ),
                SizedBox(
                  width: 250.00,
                  child: Text(
                    "Login Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.00,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 16.00,
                ),
                TextFormField(
                  controller: _emailController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration:
                        _bulidInputDecoration("Email", Icons.email_outlined),
                    validator: appValidator.validateEmail),
                SizedBox(
                  height: 16.00,
                ),
                TextFormField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true ,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _bulidInputDecoration("Password", Icons.lock),
                  validator: appValidator.validatePassword,
                ),
                SizedBox(
                  height: 40.00,
                ),
                 SizedBox(
                    height: 50.00,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow),
                        onPressed: () {
                          isLoader ? print("Loading") : _submitForm();
                        },
                        child: isLoader
                            ? Center(child: CircularProgressIndicator())
                            : Text("Login",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 3, 3, 3),
                                    fontSize: 20.00)))),
                SizedBox(
                  height: 30.00,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SingUP_UI()),
                      );
                    },
                    child: Text("Create new account",
                        style:
                            TextStyle(color: Colors.yellow, fontSize: 20.00))),
              ],
            )),
      ),
    );
  }

  InputDecoration _bulidInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        fillColor: Color(0XFF94A59),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x35949494))),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        filled: true,
        labelStyle: TextStyle(color: Color(0XFF949494)),
        labelText: label,
        suffixIcon: Icon(
          suffixIcon,
          color: Color(0XFF949494),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.00)));
  }
}
