import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:crew_portal_dev/screens/auth_screen.dart';
import 'package:crew_portal_dev/screens/home_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userBox = Hive.openBox('user');
    final auth = FirebaseAuth.instance;
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasData) {
          return const HomeScreen();
        }
        if (kIsWeb) {
          return FutureBuilder(
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final String? email = snapshot.data!.get('email');
                if (email != null) {
                  return const HomeScreen();
                }
                return AuthScreen();
              }
              return AuthScreen();
            },
            future: userBox,
          );
        }
        return AuthScreen();
      },
    );
  }
}
