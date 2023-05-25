import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:crew_portal_dev/screens/home_screen.dart';
import 'package:crew_portal_dev/screens/links_screen.dart';
import 'package:crew_portal_dev/screens/update_autoland_screen.dart';
import 'package:crew_portal_dev/screens/validity_records_screen.dart';
import 'package:crew_portal_dev/services/firebase_services.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  build(BuildContext context) {
    final userBox = Hive.openBox('user');
    return NavigationDrawer(
      children: [
        DrawerHeader(
          child: Column(
            children: [
              FutureBuilder(
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          Image.memory(snapshot.data!.get('photo')).image,
                    );
                  }
                  return const Text('');
                },
                future: userBox,
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(snapshot.data!.get('displayName'));
                  }
                  return const Text('');
                },
                future: userBox,
              )
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.grading),
          title: const Text('Certificate of Proficiency'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(ValidityRecordsScreen.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.airplanemode_active),
          title: const Text('Update Autoland (Flight)'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(UpdateAutolandScreen.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.link),
          title: const Text('Links'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(LinksScreen.routeName);
          },
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
        ),
        StreamBuilder(
          builder: (ctx, snapshot) {
            if (snapshot.data == null) {
              return ListTile(
                leading: const Icon(Icons.sync),
                title: const Text('Sync'),
                onTap: () async {
                  Navigator.of(context).pop();
                  FirebaseServices.signIn();
                  Navigator.of(context).pushReplacementNamed('/');
                  return;
                },
              );
            }
            return const SizedBox();
          },
          stream: FirebaseServices.auth.authStateChanges(),
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () async {
            Navigator.of(context).pop();
            await FirebaseServices.signOut();
            if (context.mounted) {
              Navigator.of(context).pushReplacementNamed('/');
            }
            return;
          },
        ),
      ],
    );
  }
}
