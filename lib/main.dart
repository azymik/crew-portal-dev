import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:crew_portal_dev/screens/home_screen.dart';
import 'package:crew_portal_dev/screens/links_screen.dart';
import 'package:crew_portal_dev/screens/start_screen.dart';
import 'package:crew_portal_dev/screens/update_autoland_screen.dart';
import 'package:crew_portal_dev/screens/validity_records_screen.dart';
import 'package:crew_portal_dev/services/firebase_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseServices.initializer();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crew Portal',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const StartScreen(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        LinksScreen.routeName: (context) => const LinksScreen(),
        UpdateAutolandScreen.routeName: (context) =>
            const UpdateAutolandScreen(),
        ValidityRecordsScreen.routeName: (context) =>
            const ValidityRecordsScreen(),
      },
    );
  }
}
