import 'package:flutter/material.dart';
import 'package:mobile/design/app_theme.dart';
import 'package:mobile/features/auth/sign_up.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SignUpPage(),
    );
  }
}
