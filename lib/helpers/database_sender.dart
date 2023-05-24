import 'package:firebase_database/firebase_database.dart';

import 'package:crew_portal_dev/helpers/aims_information.dart';
import 'package:crew_portal_dev/helpers/id_email_name.dart';

class DatabaseSender {
  static Future<void> sender() async {
    var map = {};
    FirebaseDatabase database = FirebaseDatabase.instance;
    var id = '';
    var name = '';
    var email = '';
    var databaseId = '';
    for (var i = 0; i < aimsInformation.length; i = i + 10) {
      if (aimsInformation[i] != '') {
        id = aimsInformation[i];
        var index = idEmailName.indexOf(id);
        name = idEmailName[index + 2];
        email = idEmailName[index + 1];
        databaseId = idEmailName[index + 1].replaceAll(RegExp(r'[^\w\s]+'), '');
        map[databaseId] = {
          'id': id,
          'name': name,
          'email': email,
          'pos': aimsInformation[i + 4],
          'qualifications': {
            aimsInformation[i + 7]: {
              'desc': aimsInformation[i + 6],
              'last': aimsInformation[i + 8],
              'expiry': aimsInformation[i + 9]
            }
          },
        };
      } else {
        map[databaseId]['qualifications'][aimsInformation[i + 7]] = {
          'desc': aimsInformation[i + 6],
          'last': aimsInformation[i + 8],
          'expiry': aimsInformation[i + 9]
        };
      }
      if (aimsInformation[i + 7] == 'OPCCTM') {
        if (rhsList.contains(databaseId)) {
          map[databaseId]['qualifications']['RHS'] = {
            'desc': 'Right Hand Seat',
            'last': aimsInformation[i + 8],
            'expiry': aimsInformation[i + 9],
          };
        }
        if (crpList.contains(databaseId)) {
          map[databaseId]['qualifications']['CRP'] = {
            'desc': 'Cruise Relief Pilot',
            'last': aimsInformation[i + 8],
            'expiry': aimsInformation[i + 9],
          };
        }
      }
    }
    DatabaseReference ref = database.ref('users');
    await ref.set(map);
    print('done');
    return;
  }

  static Future<void> autolandSender() async {
    var map = {};
    FirebaseDatabase database = FirebaseDatabase.instance;
    var databaseId = '';
    for (var i = 1; i < idEmailName.length; i = i + 3) {
      databaseId = idEmailName[i].replaceAll(RegExp(r'[^\w\s]+'), '');
      map[databaseId] = {
        'qualifications': {
          'ATLNFLT': {
            'desc': 'Autoland in Aircraft',
            'last': '01/01/23',
            'expiry': '01/07/23'
          },
        }
      };
    }
    DatabaseReference ref = database.ref('autolandFlight');
    await ref.set(map);
    print('done');
    return;
  }
}
