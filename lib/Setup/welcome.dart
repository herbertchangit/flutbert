import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutbert/Pages/home.dart';
import 'package:flutbert/Setup/signIn.dart';
import 'package:flutbert/Setup/signUp.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My firebase app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () { navigateToSignIn(); },
            child: const Text('Sign In'),
          ),
          ElevatedButton(
            onPressed: () { navigateToSignUp(); },
            child: const Text('Sign Up'),
          )
        ],
      ),
    );
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage(), fullscreenDialog: true));
  }
}