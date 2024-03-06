import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/components/my_button.dart';
import 'package:mobile/components/text_fields.dart';
import 'package:mobile/features/auth/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: Lottie.asset(
                  "assets/lottie/login.json",
                  height: 100,
                  width: 100,
                  animate: true,
                  repeat: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    MyTextField(
                      controller: usernameController,
                      hintText: "username",
                      icon: Icons.person_outline,
                    ),
                    MyTextField(
                      controller: passwordController,
                      hintText: "Password",
                      icon: Icons.security_rounded,
                    ),
                    MyTextField(
                      controller: confirmPasswordController,
                      hintText: "Confirm Password",
                      icon: Icons.security,
                    ),
                  ],
                ),
              ),
              MyButton(onTap: () {}, text: "Sign Up"),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        )),
                    child: const Text(
                      "Login now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
