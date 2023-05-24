import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import 'package:crew_portal_dev/firebase_options.dart';
import 'package:crew_portal_dev/services/hive_services.dart';

class FirebaseServices {
  static Future<void> initializer() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (kIsWeb) {
      await FirebaseAuth.instance.setPersistence(Persistence.INDEXED_DB);
    } else {
      FirebaseAuth.instance;
    }
    FirebaseDatabase.instance;
    if (!kIsWeb) {
      FirebaseDatabase.instance.setPersistenceEnabled(true);
    }
    return;
  }

  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> signIn() async {
    final firebaseAuth = FirebaseAuth.instance;

    Future<void> putBoxUser() async {
      http.Response response = await http.get(
        Uri.parse(firebaseAuth.currentUser!.photoURL!),
      );
      await HiveServices.putAllInBox(
        'user',
        {
          'displayName': firebaseAuth.currentUser!.displayName,
          'email': firebaseAuth.currentUser!.email!.split('@')[0],
          'photoURL': firebaseAuth.currentUser!.photoURL,
          'photo': response.bodyBytes,
        },
      );
      return;
    }

    if (kIsWeb) {
      try {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        await firebaseAuth.signInWithPopup(googleProvider);
        await putBoxUser();
        return;
      } catch (e) {
        return;
      }
    } else {
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await firebaseAuth.signInWithCredential(credential);
        await putBoxUser();
        return;
      } catch (error) {
        return;
      }
    }
  }

  static Future<void> signOut() async {
    try {
      await HiveServices.putAllInBox(
        'user',
        {
          'displayName': null,
          'email': null,
          'photoURL': null,
          'photo': null,
        },
      );
      await FirebaseAuth.instance.signOut();
      return;
    } catch (error) {
      return;
    }
  }
}
