import 'package:flutter/material.dart';
import 'package:socialapp/auth/auth_service.dart';
import 'package:socialapp/components/my_button.dart';
import 'package:socialapp/components/my_textfield.dart';

class SignUpPage extends StatelessWidget {
  void Function()? onTap;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();
  SignUpPage({super.key, required this.onTap});

  void signUp(BuildContext context) async {
    final authService = AuthService();

    if (passwordController.text == confirmPwController.text) {
      try {
        await authService.signUpWithEmailPassword(emailController.text,
            passwordController.text, userNameController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Passwords don't match!"),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
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

                //user name
                MyTextField(
                    obscureText: false,
                    controller: userNameController,
                    hintText: 'Enter Username'),

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

                //confirm password
                MyTextField(
                    obscureText: true,
                    controller: confirmPwController,
                    hintText: 'Enter confirm password'),

                //login button
                MyButton(onTap: () => signUp(context), name: "Sign Up"),

                //to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already registerd? '),
                    GestureDetector(onTap: onTap, child: Text('Login now!')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
