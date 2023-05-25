import 'package:flutter/material.dart';

import 'package:crew_portal_dev/services/validity_services.dart';
import 'package:crew_portal_dev/widgets/custom_drawer.dart';
import 'package:crew_portal_dev/widgets/validity_card.dart';

class ValidityRecordsScreen extends StatefulWidget {
  const ValidityRecordsScreen({super.key});

  static const routeName = '/validity-records';

  @override
  State<ValidityRecordsScreen> createState() => _ValidityRecordsScreenState();
}

class _ValidityRecordsScreenState extends State<ValidityRecordsScreen> {
  var isInit = true;
  var qualifications = {};
  var alandQualifications = {};

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (isInit) {
      qualifications = await ValidityServices.getQualsFromBox();
      alandQualifications = await ValidityServices.getAutolandFromBox();
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
              code: e.value['last'] != ''
                  ? 'Last Done: ${e.value['last']}'
                  : e.key,
              desc: e.value['desc']!,
              expiry: e.value['expiry']!),
        )
        .toList();
    final alandValidityCardList = alandQualifications.entries
        .map(
          (e) => ValidityCard(
              code: e.value['last'] != ''
                  ? 'Last Done: ${e.value['last']}'
                  : e.key,
              desc: e.value['desc']!,
              expiry: e.value['expiry']!),
        )
        .toList();

    validityCardList.addAll(alandValidityCardList);

    if (validityCardList.isNotEmpty) {
      validityCardList.sort(
        (a, b) => a.date.compareTo(b.date),
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1000) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Certificate of Proficiency'),
            ),
            drawer: const CustomDrawer(),
            body: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: isInit
                    ? const CircularProgressIndicator()
                    : ListView(
                        children: [...validityCardList],
                      ),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Certificate of Proficiency'),
          ),
          drawer: const CustomDrawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: isInit
                ? const Center(child: CircularProgressIndicator())
                : GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      mainAxisExtent: 80,
                    ),
                    children: [
                      ...validityCardList,
                    ],
                  ),
          ),
        );
      },
    );
  }
}
