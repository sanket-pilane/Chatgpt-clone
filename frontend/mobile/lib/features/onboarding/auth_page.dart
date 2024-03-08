import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/features/auth/auth.dart';
import 'package:mobile/features/auth/login.dart';
import 'package:mobile/features/chat/chat_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const ChatPage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
