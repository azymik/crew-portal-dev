import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:crew_portal_dev/services/validity_services.dart';
import 'package:crew_portal_dev/widgets/custom_drawer.dart';
import 'package:crew_portal_dev/widgets/validity_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isInit = true;
  var qualifications = {};
  var alandQualifications = {};

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (isInit) {
      qualifications = await ValidityServices.getAndSaveQualifications(kIsWeb);
      alandQualifications = await ValidityServices.getAndSaveAutoland(kIsWeb);
      setState(() {
        isInit = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final validityCardList = qualifications.entries
        .map(
          (e) => ValidityCard(
              code: e.value['last'] != '' ? e.value['last'] : e.key,
              desc: e.value['desc']!,
              expiry: e.value['expiry']!),
        )
        .toList();
    final alandValidityCardList = alandQualifications.entries
        .map(
          (e) => ValidityCard(
              code: e.value['last'] != '' ? e.value['last'] : e.key,
              desc: e.value['desc']!,
              expiry: e.value['expiry']!),
        )
        .toList();

    validityCardList.addAll(alandValidityCardList);

    var essentialVaildityCardList = [];

    if (validityCardList.isNotEmpty) {
      validityCardList.sort(
        (a, b) => a.date.compareTo(b.date),
      );
      essentialVaildityCardList = validityCardList
          .where((vCard) =>
              vCard.date.isBefore(DateTime.now().add(const Duration(days: 90))))
          .toList();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1000) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            drawer: const CustomDrawer(),
            body: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: isInit
                    ? const CircularProgressIndicator()
                    : ListView(
                        children: [
                          const ListTile(
                            title: Text(
                              'Expire within 90 days',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ...essentialVaildityCardList
                        ],
                      ),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          drawer: const CustomDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: isInit
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    shrinkWrap: true,
                    children: [
                      const ListTile(
                        title: Text(
                          'Expire within 90 days',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          mainAxisExtent: 80,
                        ),
                        children: [
                          ...essentialVaildityCardList,
                        ],
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
