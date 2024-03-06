import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:mobile/components/my_button.dart';
import 'package:mobile/components/text_fields.dart';
import 'package:mobile/features/auth/sign_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Center(
              //   child: Lottie.asset(
              //     "assets/lottie/login.json",
              //     height: 100,
              //     width: 100,
              //     animate: true,
              //   ),
              // ),
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
                  ],
                ),
              ),
              MyButton(onTap: () {}, text: "Login Up"),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont't have an account?"),
                  const SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ));
                    },
                    child: const Text(
                      "Sign up",
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