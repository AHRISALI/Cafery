import 'package:cafery/authenticate/authenticate.dart';
import 'package:cafery/models/user.dart';
import 'package:cafery/services/auth.dart';
import 'package:cafery/views/home_screen.dart';
import 'package:cafery/views/startup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return const StartupScreen();
          }
        });
  }
}
