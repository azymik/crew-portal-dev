import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:crew_portal_dev/helpers/database_sender.dart';
import 'package:crew_portal_dev/widgets/custom_drawer.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({super.key});

  static const routeName = '/links';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Links'),
        ),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              mainAxisExtent: 40,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            children: [
              ElevatedButton(
                onPressed: () async {
                  final url = Uri.parse(
                      'https://sites.google.com/airasia.com/tax-flightops-dashboard/home');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: const Text('Flight Ops'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final url = Uri.parse(
                      'https://sites.google.com/airasia.com/tax-training/home');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: const Text('Training & Standards'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final url = Uri.parse(
                      'http://sites.google.com/airasia.com/taxsafety');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: const Text('Safety'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final url = Uri.parse('http://ts1-tax.web.app');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: const Text('eTS-1'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final url = Uri.parse(
                      'https://classroom.google.com/w/NDMxNzE0NTYzNjgx/t/all');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: const Text('Pilot eLearning (gClassroom)'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final url =
                      Uri.parse('https://lms.thaiairasia.co.th/lms_airasia/');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: const Text('Pilot eLearning (AirAsia)'),
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     await DatabaseSender.sender();
              //   },
              //   child: const Text('Send Database'),
              // ),
            ],
          ),
        ));
  }
}
