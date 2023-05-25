import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:crew_portal_dev/helpers/dummy_qualifications.dart';
import 'package:crew_portal_dev/services/hive_services.dart';

class ValidityServices {
  static Future<Map<dynamic, dynamic>> getAndSaveQualifications(
      bool isWeb) async {
    var qualifications = {};
    final firebaseAuth = FirebaseAuth.instance;
    final databaseId = firebaseAuth.currentUser != null
        ? firebaseAuth.currentUser!.email!
            .split('@')[0]
            .replaceAll(RegExp(r'[^\w\s]+'), '')
        : '';

    if (isWeb && firebaseAuth.currentUser == null) {
      qualifications = await HiveServices.getFromBox('quals', 'qualifications');
    } else {
      try {
        DatabaseReference qualificationsRef =
            FirebaseDatabase.instance.ref('users/$databaseId/qualifications');
        final qualsSnapshot = await qualificationsRef.get();
        await HiveServices.putInBox(
            'quals', 'qualifications', qualsSnapshot.value);
        qualifications = qualsSnapshot.value as Map<dynamic, dynamic>;
      } catch (_) {
        qualifications = dummyQualification;
      }
    }

    return qualifications;
  }

  static Future<Map<dynamic, dynamic>> getQualsFromBox() async {
    var qualifications =
        await HiveServices.getFromBox('quals', 'qualifications');
    if (qualifications != null) {
      return qualifications;
    } else {
      return dummyQualification;
    }
  }

  static Future<void> updateAutoland(String value) async {
    final int expiryYear = int.parse(value.split('/')[2]) + 2000;
    final int expiryMonth = int.parse(value.split('/')[1]);
    final expiry = DateTime(expiryYear + 2000, expiryMonth + 7, 0);
    final object = {
      'ATLNFLT': {
        'desc': 'Autoland in Aircraft',
        'last': value,
        'expiry':
            '${expiry.toString().substring(8, 10)}/${expiry.toString().substring(5, 7)}/${expiry.toString().substring(2, 4)}',
      },
    };
    await HiveServices.putInBox('autoland', 'qualifications', object);
    await HiveServices.putInBox('autoland', 'isSynced', false);
  }

  static Future<Map<dynamic, dynamic>> getAndSaveAutoland(bool isWeb) async {
    var alandQualifications = {};
    final firebaseAuth = FirebaseAuth.instance;
    final databaseId = firebaseAuth.currentUser != null
        ? firebaseAuth.currentUser!.email!
            .split('@')[0]
            .replaceAll(RegExp(r'[^\w\s]+'), '')
        : '';

    if (isWeb && firebaseAuth.currentUser == null) {
      alandQualifications =
          await HiveServices.getFromBox('autoland', 'qualifications');
    } else {
      try {
        DatabaseReference autolandRef = FirebaseDatabase.instance
            .ref('autolandFlight/$databaseId/qualifications');

        if (await HiveServices.getFromBox('autoland', 'isSynced') != null) {
          if (!await HiveServices.getFromBox('autoland', 'isSynced')) {
            await autolandRef.set(
                await HiveServices.getFromBox('autoland', 'qualifications'));
          }
        }

        final autolandSnapshot = await autolandRef.get();
        await HiveServices.putInBox(
            'autoland', 'qualifications', autolandSnapshot.value);
        await HiveServices.putInBox('autoland', 'isSynced', true);
        alandQualifications = autolandSnapshot.value as Map<dynamic, dynamic>;
      } catch (_) {
        alandQualifications = dummyAutoLandQualification;
      }
    }

    return alandQualifications;
  }

  static Future<Map<dynamic, dynamic>> getAutolandFromBox() async {
    var alandQualifications =
        await HiveServices.getFromBox('autoland', 'qualifications');
    if (alandQualifications != null) {
      return alandQualifications;
    } else {
      return dummyAutoLandQualification;
    }
  }
}
