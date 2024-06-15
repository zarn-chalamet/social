import 'package:flutter/material.dart';
import 'package:socialapp/auth/auth_service.dart';
import 'package:socialapp/components/my_button.dart';
import 'package:socialapp/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  void Function()? onTap;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.person,
                size: 100,
              ),

              SizedBox(
                height: 25,
              ),

              //app name
              Text('S O C I A L'),

              SizedBox(
                height: 20,
              ),

              //email text field
              MyTextField(
                  obscureText: false,
                  controller: emailController,
                  hintText: 'Enter Email'),

              //password text field
              MyTextField(
                  obscureText: true,
                  controller: passwordController,
                  hintText: 'Enter password'),

              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text('forgot password?'),
                  ),
                ],
              ),

              //login button
              MyButton(onTap: () => login(context), name: "Login"),

              //to register page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have account? '),
                  GestureDetector(onTap: onTap, child: Text('Register now!')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
