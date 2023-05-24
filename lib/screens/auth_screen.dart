import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:crew_portal_dev/services/firebase_services.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key}) : firebaseAuth = FirebaseAuth.instance;
  final FirebaseAuth firebaseAuth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await FirebaseServices.signIn();
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
