import 'package:flutter/material.dart';
import 'package:quizzapp/login/login.dart';
import 'package:quizzapp/topics/topics.dart';
import 'package:quizzapp/services/auth.dart';

//Use the home page to render a different set of UI elements based on the user’s auth state in Firebase. If the user is signed in, show the topics screen. If the user is not signed in, show the login screen.

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return const LoadingScreen();
          return const Center(
            child: Text('loading...'),
          );
        } else if (snapshot.hasError) {
          return const Center(
            // child: ErrorMessage(),
            child: Text('Erreur mon reuf'),
          );
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}